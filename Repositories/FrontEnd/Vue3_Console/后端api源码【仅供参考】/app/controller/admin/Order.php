<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
use think\facade\Db;
use think\facade\Queue;

use Flex\Express\ExpressBird;

use jianyan\excel\Excel;

class Order extends Base
{
    protected $excludeValidateCheck = ['excelexport'];
    
    // 发货
    public function ship(){
        // 演示数据
    	$this->TestException();
        
        $order = request()->Model;
        // 判断订单未付款
        if (!$order->paid_time) {
            ApiException('订单未付款');
        }
        // 判断订单是否关闭
        if ($order->closed) {
            ApiException('订单已关闭');
        }
        // 判断当前订单已发货
        if ($order->ship_status !== 'pending') {
            ApiException('订单已发货');
        }
        
        // 判断是否已退款
        if ($order->refund_status !== 'pending') {
            ApiException('订单已退款');
        }
        
        // 将订单发货状态改为已发货，并存入物流信息
        $param = request()->param();
        $order->ship_status = 'delivered';
        $order->ship_data = [
            'express_company'=>$param['express_company'],
            'express_no'=>$param['express_no'],
            'express_time'=>time()
        ];
        
        $result = $order->save();
        if($result){
        	// 触发自动确认收货任务
        	$delay = cmsConfig('auto_received_day');
        	if($delay){
        	    $delay = $delay * 24 * 60 * 60;
        	   Queue::later($delay,'autoReceived',[
                    'orderId'=>$order->id
                ]); 
        	}
        }
        
        return showSuccess($result);
    }


    // 拒绝/同意 申请退款
    public function handleRefund(){
        // 演示数据
    	$this->TestException();
    	
        // 获取当前订单
        $order = request()->Model;

        // 判断订单状态是否正确
        if ($order->refund_status !== 'applied') {
            ApiException('订单状态不正确');
        }
        $param = request()->param();
        // 是否同意退款
        if ($param['agree']) {
            // 同意
            $this->__refundOrder($order);
        } else {
            // 拒绝退款
            $order->extra = [
                'refund_reason'=> isset($order->extra->refund_reason) ? $order->extra->refund_reason: null,
                'refund_disagree_reason'=>$param['disagree_reason']
            ];
            $order->refund_status = 'pending';
            $order->save();
        }
        return showSuccess($order);
    }

    // 退款逻辑
    public function __refundOrder($order){
        switch ($order->payment_method) {
            case 'alipay':
                // 生成退款单号
                $refundNo = \app\model\admin\Order::setRefundOrderNo();
                // 调用支付宝退款
                $obj = new \app\controller\common\AliPay();
                $alipay = $obj->alipay;
                $res = $alipay->refund([
                    'out_trade_no' => $order->no, // 之前的订单流水号
                    'refund_amount' => $order->total_price, // 退款金额，单位元
                    'out_request_no' => $refundNo, // 退款订单号
                ]);
                // 根据支付宝的文档，如果返回值里有 sub_code 字段说明退款失败
                if ($res->sub_code) {
                    // 将订单的退款状态标记为退款失败
                    $order->refund_no = $refundNo;
                    $order->refund_status ='failed';
                    $order->extra =[
                        'refund_failed_code'=>$res->sub_code
                    ];
                    $order->save();
                } else {
                    // 将订单的退款状态标记为退款成功并保存退款订单号
                    $order->refund_no = $refundNo;
                    $order->refund_status ='success';
                    $order->save();
                }
                break;
            case 'wechat':
                // 生成退款单号
                $refundNo = \app\model\admin\Order::setRefundOrderNo();
                // 调用微信退款
                $obj = new \app\controller\common\wechatPay();
                $wechat = $obj->wechat;
                $res = $wechat->refund([
                	'type' => 'app',
                	'out_trade_no' => $order->no, // 之前的订单流水号
				    'out_refund_no' => $refundNo, // 退款订单号
				    'total_fee' => strval($order->total_price*100), // 退款金额，单位元
				    'refund_fee' => strval($order->total_price*100), // 退款金额，单位元
				    'refund_desc' => $order->extra->refund_reason,
                ]);
                if ($res->return_code !== 'SUCCESS') {
                    // 将订单的退款状态标记为退款失败
                    $order->refund_no = $refundNo;
                    $order->refund_status ='failed';
                    $order->extra =[
                        'refund_failed_code'=>$res->return_msg
                    ];
                    $order->save();
                } else {
                    // 将订单的退款状态标记为退款成功并保存退款订单号
                    $order->refund_no = $refundNo;
                    $order->refund_status ='success';
                    $order->save();
                }
                break;
        }
    }


	// 后台订单列表
	public function orderList(){
		$param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $tab = getValByKey('tab',$param,'all');
        $model = $this->M;
        // 订单类型
        switch ($tab) {
        	case 'nopay': // 待付款
        		$model = $this->M->where('closed',0)
        						->whereNull('payment_method');
        		break;
        	case 'noship': // 待发货
        		$model = $this->M->where('closed',0)
        						->whereNotNull('payment_method')
        						->where('ship_status','pending')
        						->where('refund_status','pending');
        		break;
        	case 'shiped': // 已发货
        		$model = $this->M->where('closed',0)
        						->whereNotNull('payment_method')
        						->where('ship_status','delivered')
        						->where('refund_status','pending');
        		break;
        	case 'received': // 已收货
        		$model = $this->M->where('closed',0)
        						->whereNotNull('payment_method')
        						->where('ship_status','received')
        						->where('refund_status','pending');
        		break;
        	case 'finish': // 已完成
        		$model = $this->M->where('closed',0)
        						->whereNotNull('payment_method')
        						->where('ship_status','received')
        						->where('refund_status','pending');
        		break;
        	case 'closed': // 已关闭
        		$model = $this->M->where('closed',1);
        		break;
        	case 'refunding': // 退款中
        		$model = $this->M->where('closed',0)
        						->where('refund_status','applied');
        		break;
        }
        // 搜索条件
        if (array_key_exists('starttime',$param) && array_key_exists('endtime',$param)) {
        	$model = $model->whereTime('create_time', 'between', [$param['starttime'], $param['endtime']]);
        }
        if (array_key_exists('no',$param)) {
        	$model = $model->where('no','like','%'.$param['no'].'%');
        }
        if (array_key_exists('name',$param)) {
        	$model = $model->where('address->name','like','%'.$param['name'].'%');
        }
        if (array_key_exists('phone',$param)) {
        	$model = $model->where('address->phone','like','%'.$param['phone'].'%');
        }
        
        $totalCount = $model->count();
        $list = $model->page($param['page'],$limit)
		        ->with([
		            'orderItems'=>function($query){
                		$query->field(['id','order_id','shop_id','goods_id','num','price','skus_type'])
                		->with([
	            			'goodsItem'=>function ($que){
	            				$que->field(['id','title','cover','sku_type']);
	            			},
	            			'goodsSkus'=>function($q){
        						$q->field(['id','skus']);
        					}
            			]);
                	},
                	'user'=>function($query){
                	    $query->field(['id','nickname','username','avatar']);
                	}
                ])
		        ->order([ 'id'=>'desc' ])
				->select();
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount
        ]);
	}


	// 批量删除
    public function deleteAll(){
        // 演示数据
    	$ids = request()->param("ids");
    	if ($ids[0] <= 608) {
    		$this->TestException();
    	}
    	
        return showSuccess($this->M->MdeleteAll());
    }
    
    // 导出订单
    public function excelexport(){
    	
    	$param = request()->param();
        $tab = getValByKey('tab',$param,'all');
        $model = $this->M;
        // 订单类型
        switch ($tab) {
        	case 'nopay': // 待付款
        		$model = $this->M->where('closed',0)
        						->whereNull('payment_method');
        		break;
        	case 'noship': // 待发货
        		$model = $this->M->where('closed',0)
        						->whereNotNull('payment_method')
        						->where('ship_status','pending')
        						->where('refund_status','pending');
        		break;
        	case 'shiped': // 已发货
        		$model = $this->M->where('closed',0)
        						->whereNotNull('payment_method')
        						->where('ship_status','delivered')
        						->where('refund_status','pending');
        		break;
        	case 'received': // 已收货
        		$model = $this->M->where('closed',0)
        						->whereNotNull('payment_method')
        						->where('ship_status','received')
        						->where('refund_status','pending');
        		break;
        	case 'finish': // 已完成
        		$model = $this->M->where('closed',0)
        						->whereNotNull('payment_method')
        						->where('ship_status','received')
        						->where('refund_status','pending');
        		break;
        	case 'closed': // 已关闭
        		$model = $this->M->where('closed',1);
        		break;
        	case 'refunding': // 退款中
        		$model = $this->M->where('closed',0)
        						->where('refund_status','applied');
        		break;
        }
        // 搜索条件
        if (array_key_exists('starttime',$param) && array_key_exists('endtime',$param)) {
        	$model = $model->whereTime('create_time', 'between', [$param['starttime'], $param['endtime']]);
        }
        
        $list = $model->with(['orderItems.goodsItem','user'])
		        ->order([ 'id'=>'desc' ])
		        ->limit(1000)
				->select();
		
		$arr = [];
		$list->each(function($item) use(&$arr){
			// 联系方式
			$address = $item->address ="地址：".$item->address->province.$item->address->city.$item->address->district.$item->address->address." \n 姓名：".$item->address->name." \n 手机：".$item->address->phone;
			// 订单商品
			$order_items = '';
			foreach ($item->order_items as $val){
				$order_items .= '商品：'.($val['goods_item'] ? $val['goods_item']['title'] : '商品已被删除')."\n ";
				$order_items .= '数量：'.$val['num']."\n ";
				$order_items .= '价格：'.$val['price']."\n\n ";
			}
			// 支付情况
			$pay = '未支付';
			switch ($item->payment_method) {
				case 'wechat':
					$pay = "支付方式：微信支付 \n 支付时间：".date('Y-m-d H:m:s',$item->paid_time);
					break;
				case 'wechat':
					$pay = "支付宝支付 \n 支付时间：".date('Y-m-d H:m:s',$item->paid_time);
					break;
			}
			// 发后状态
			$ship = '待发货';
			if ($item->ship_status && $item->ship_data) {
				$ship = "快递公司：".$item->ship_data->express_company." \n快递单号：".$item->ship_data->express_no." \n发货时间：".date('Y-m-d H:m:s',$item->ship_data->express_time);
			}
			
			$arr[] = [
				'id'=>$item->id,
				'no'=>$item->no,
				'address'=>$item->address,
				'order_items'=>$order_items,
				'pay'=>$pay,
				'ship'=>$ship,
				'create_time'=>$item->create_time
			];
		});
    	
    	// [名称, 字段名, 类型, 类型规则]
		$header = [
		    ['订单ID', 'id', 'text'],
		    ['订单号', 'no', 'text'],
		    ['收货地址', 'address'], // 规则不填默认text
		    ['商品', 'order_items'],
		    ['支付情况', 'pay'],
		    ['发货情况', 'ship'],
		    ['下单时间', 'create_time'],
		];
		// 简单使用
		return Excel::exportData($arr, $header);
		
		// 定制 默认导出xlsx 支持 : xlsx/xls/html/csv
		// return Excel::exportData($list, $header, '测试', 'xlsx');
    }
    
    // 查看物流信息
	public function getShipInfo(){
        // 判断是否已关闭订单
        $order = request()->Model;
        if ($order->closed) {
           ApiException('订单已关闭');
        }
        // 订单未发货
        if ($order->ship_status == 'pending' || $order->refund_status !== 'pending') {
           ApiException('订单状态不正确');
        }
		// 物流号
		if(!$order->ship_data || !$order->ship_data->express_no){
			ApiException('快递单号不存在');
		}
		
//         // 其他安全验证
//         $c = cmsConfig('ship');
//         $appkey = $c ? $c : config('cms.ship.appkey');
// 		$url = "https://api.jisuapi.com/express/query?appkey=$appkey";
// 		$type = 'auto';
// 		$number = $order->ship_data->express_no;
		 
// 		$post = [
// 			'type'=>$type,
// 		    'number'=>$number
// 		];
		
// 		$ch = curl_init();
// 		curl_setopt($ch, CURLOPT_URL, $url);
// 		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
// 		// post数据
// 		curl_setopt($ch, CURLOPT_POST, 1);
// 		// post的变量
// 		curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
// 		$result = curl_exec($ch);
// 		curl_close($ch);
		 
// 		$jsonarr = json_decode($result, true);
		
		$empty = [
		    "status"=> 300,
		    "msg"=> "订单号已失效",
		    "result"=>""
		];
		
		$jsonarr = [
            "status"=> 0,
            "msg"=> "ok",
            "result"=> [
                "number"=> "4324****2412564",
                "type"=> "yunda",
                "typename"=> "韵达快运",
                "logo"=> "https://api.jisuapi.com/express/static/images/logo/80/yunda.png",
                "list"=> [
                    [
                        "time"=> "2022-03-14 14:22:03",
                        "status"=> "【代收点】您的快件已签收，签收人在 观园国际A栋架空层（原e栈）(观园国际A栋架空层（原e栈）)领取，投诉电话=>020-23****06"
                    ],
                    [
                        "time"=> "2022-03-14 10:02:58",
                        "status"=> "【代收点】您的快件已暂存至（温馨提示您：戴口罩取快递，个人防护要牢记）观园国际A栋架空层(原e栈)(观园国际A栋架空层(原e栈))，请及时领取，如有疑问请电联快递员=>吴**(186****0431) ，投诉电话=>020-23****06"
                    ],
                    [
                        "time"=> "2022-03-14 08:48:21",
                        "status"=> "【广州市】广东广州天河区珠江新城公司[020-88****30] 快递员 吴道波（186****0431） 正在为您派送。疫情期间快递各环节已消杀，今日小哥测温正常，将佩戴口罩为您派送，您也可联系小哥将快件放置指定代收点或快递柜（温馨提示您：戴口罩取快递，个人防护要牢记），【95121为韵达快递员外呼专属号码，请放心接听】"
                    ],
                    [
                        "time"=> "2022-03-14 03:19:22",
                        "status"=> "【广州市】已到达 广东广州天河区珠江新城公司[020-88****30]"
                    ],
                    [
                        "time"=> "2022-03-13 19:44:20",
                        "status"=> "【广州市】已离开 华南枢纽分拨交付中心；发往 广东广州天河区珠江新城公司"
                    ],
                    [
                        "time"=> "2022-03-13 19:41:45",
                        "status"=> "【广州市】已到达 华南枢纽分拨交付中心"
                    ],
                    [
                        "time"=> "2022-03-12 21:13:40",
                        "status"=> "【嘉兴市】已离开 浙江杭州分拨交付中心；发往 华南枢纽分拨交付中心"
                    ],
                    [
                        "time"=> "2022-03-12 21:10:32",
                        "status"=> "【嘉兴市】已到达 浙江杭州分拨交付中心"
                    ],
                    [
                        "time"=> "2022-03-12 17:40:09",
                        "status"=> "【杭州市】浙江临安市昌化公司-包迪（178****0342） 已揽收，小哥每日测体温，请放心收寄快递"
                    ]
                ],
                "deliverystatus"=> 3,
                "issign"=> 1
            ]
        ];
		return showSuccess($order->ship_data->express_no == '432447792412564' ? $jsonarr : $empty);
	}
}
