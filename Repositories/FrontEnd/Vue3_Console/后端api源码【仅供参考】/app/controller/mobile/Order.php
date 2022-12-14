<?php

namespace app\controller\mobile;

use think\Request;
use app\controller\common\Base;
use think\facade\Db;
use think\facade\Queue;

use Flex\Express\ExpressBird;

use jianyan\excel\Excel;

class Order extends Base
{
    protected $excludeValidateCheck = ['index'];
    protected $ModelPath = 'admin\Order';
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
    	$type = request()->param('type');
        $orders = request()->UserModel->orders()
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
                	}
                ])
                ->scope($type)
                ->order('id','desc')
                ->field(['id','user_id','no','total_price','paid_time','refund_status','ship_status','create_time','reviewed'])
                ->select();
        // 过滤
        $orders->each(function($item, $key){
        	$item->order_items->each(function($item2, $key2){
        		if($item2->skus_type === 0){
        			$item2->goods_skus = null;
        		}
        	});
        });
        return showSuccess($orders);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        // 启动事务
        $order = Db::transaction(function (){
            $param = request()->param();
            $userModel = request()->UserModel;

            // 1.更新收货地址最后操作时间
            $address =request()->UserAddresses;
            $address->last_used_time = time();
            $address->save();

            // 2.创建一个订单
            $order = $this->M->create([
                'address'=>$address->toArray(),
                'remark'=>getValByKey('remark',$param,''),
                'total_price'=>0,
                'user_id'=>$userModel->id,
                'coupon_user_id'=>getValByKey('coupon_user_id',$param,0)
            ]);

            if (!$order) {
                ApiException('创建订单失败');
            }

            // 订单总金额
            $totalPrice = 0;
            $cartIds = [];
            // 3.遍历用户提交的 SKU，创建一个 OrderItem 并直接与当前订单关联
            $items = request()->items;
            foreach ($items as $value) {
                // 获取模型
                $skuModel = $value['skus_type'] === 0 ?'\app\model\admin\goods':'\app\model\admin\goodsSkus';
                // 获取当前商品
                $sku = $skuModel::find($value['shop_id']);
                // 获取当前商品价格（多规格|单规格）
                $price = $sku->pprice ? $sku->pprice : $sku->sku_value->pprice;
                $goods_id = $value['skus_type'] === 0 ? $sku->id : $sku->goods_id;
                // 创建OrderItem
                $data = [
                    'skus_type'=>$value['skus_type'],
                    'shop_id'=> $value['shop_id'],
                    'num'=>$value['num'],
                    'price'=>$price,
                    'goods_id'=>$goods_id,
                    'user_id'=>$userModel->id
                ];
                $order->orderItems()->save($data);
                // 计算总金额
                $totalPrice += $data['price'] * $data['num'];
                // 减去优惠券
                if (request()->coupon) {
                    $totalPrice = $this->M->getPriceByCoupon($totalPrice);
                    request()->couponUser->changeUsed(1);
                }
                // 获取购物车id
                $cartIds[] = $value['id'];
                // 减库存
                if (!$this->M->decStock($data['num'],$sku)) {
                    ApiException('商品库存不足');
                }
            }
            // 4.更新订单总金额
            $order->total_price = $totalPrice;
            $order->save();
            // 5.将当前用户下单的商品从购物车中移除
            $userModel->carts()->where('id','in',$cartIds)->delete();
            // 触发关闭订单任务
            $delay = cmsConfig('close_order_minute');
            if($delay){
                $delay = $delay * 60;
                Queue::later($delay,'CloseOrder',[
                    'orderId'=>$order->id
                ]);
            }
            
            // 创建发票申请
            if(array_key_exists('invoice',$param)){
                $invoiceData = $param['invoice'];
                $invoiceData['user_id'] = $userModel->id;
                $invoiceData['order_id'] = $order->id;
                if(!(new \app\model\admin\Invoice())->create($invoiceData)){
                    ApiException('创建发票申请失败');
                }
            }
            
            // 返回订单
            return $order;
        });
        return showSuccess($order);
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        // 验证是否是本人操作
        $this->M->__checkActionAuth();
        // 获取订单
        $order = request()->Model;
        $order->orderItems->each(function($item) use($order){
            if ($item->skus_type !== 1) {
                $order->append(['orderItems.goodsItem','couponUserItem.coupon']);
            }else{
                $order->append(['orderItems.goodsItem','orderItems.goodsSkus','couponUserItem.coupon']);
            }
        });
        $result = $order->toArray();
        // 未支付（自动取消）
        if(!$order->paid_time){
        	$result['end_time'] = strtotime($result['create_time']) + config('cms.order.delay');
        }
        // 已发货（自动收货）
        if($order->ship_status === 'delivered'){
        	$result['end_time'] = $order->ship_data->express_time + config('cms.order.received_delay');
        }
        return showSuccess($result);
    }


    // 订单收货
    public function received(){
        // 验证是否是用户本人
        $this->M->__checkActionAuth();
        // 获取订单
        $order = request()->Model;
        // 是否已关闭订单
        if ($order->closed) {
            ApiException('订单已关闭');
        }
        // 判断是否已发货
        if ($order->ship_status !== 'delivered') {
            ApiException('订单未发货');
        }
        // 更新为：已收货
        $order->ship_status = 'received';
        return showSuccess($order->save());
    }
    
    // 申请退款
    public function applyRefund(){
        // 验证当前用户
        $this->M->__checkActionAuth();
        // 判断是否已关闭订单
        $order = request()->Model;
        if ($order->closed) {
           ApiException('订单已关闭');
        }
        // 判断订单是否已付款
        if (!$order->paid_time) {
            ApiException('该订单未支付，不可退款');
        }
        // 判断订单状态是否正确
        if ($order->refund_status !== 'pending') {
            ApiException('该订单已申请过退款，请勿重复申请');
        }
        // 将用户输入的退款理由放到订单的 extra 字段中,将订单退款状态改为已申请退款
        $param = request()->param();
        $order->extra = [
            'refund_reason'=>$param['reason']
        ];
        $order->refund_status = 'applied';
        return showSuccess($order->save());
    }

 
    // 取消订单
    public function closeOrder(){
    	 // 验证当前用户
        $this->M->__checkActionAuth();
        // 判断是否已关闭订单
        $order = request()->Model;
        if ($order->closed) {
           ApiException('订单已关闭');
        }
        // 判断订单是否已付款
        if ($order->paid_time) {
            ApiException('该订单已付款，不可关闭');
        }
        // 开始事务
        $result = Db::transaction(function() use($order){
            // 将订单的 closed 字段标记为 1，即关闭订单
            $order->closed = 1;
            $order->save();
            trace('[自动关闭订单] 设置订单为关闭状态', 'info');
            // 循环遍历订单中的商品 SKU，将订单中的数量加回到 SKU 的库存中去
            $order->orderItems->each(function($v) use($order){
                // 判断单规格还是多规格
                $skuModel = $v->skus_type === 0 ?'\app\model\admin\Goods':'\app\model\admin\GoodsSkus';
                // 根据订单获取当前商品
                $sku = $skuModel::find($v->shop_id);
                if ($sku) {
                    $order->addStock($v->num,$sku);
                } else {
                    $skuType = $v->skus_type === 0 ?'单规格':'多规格';
                }
            });
            // 恢复优惠券使用情况
            if ($order->coupon_user_id) {
               $CouponUser = \app\model\admin\CouponUser::find($order->coupon_user_id);
               $CouponUser->changeUsed(0);
            }
            return true;
        });
        if(!$result){
        	ApiException('关闭订单失败');
        }
        return showSuccess($result);
    }

	// 查看物流信息
	public function getShipInfo(){
		// // 验证当前用户
        $this->M->__checkActionAuth();
        // 判断是否已关闭订单
        $order = request()->Model;
        if ($order->closed) {
           ApiException('订单已关闭');
        }
        // 订单未发货
        if ($order->ship_status !== 'delivered' || $order->refund_status !== 'pending') {
           ApiException('订单状态不正确');
        }
		// 物流号
		if(!$order->ship_data || !$order->ship_data->express_no){
			ApiException('快递单号不存在');
		}
		
        // 其他安全验证
        $c = cmsConfig('ship');
        $appkey = $c ? $c : config('cms.ship.appkey');
		$url = "https://api.jisuapi.com/express/query?appkey=$appkey";
		$type = 'auto';
		$number = $order->ship_data->express_no;
		 
		$post = [
			'type'=>$type,
		    'number'=>$number
		];
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		// post数据
		curl_setopt($ch, CURLOPT_POST, 1);
		// post的变量
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
		$result = curl_exec($ch);
		curl_close($ch);
		 
		$jsonarr = json_decode($result, true);
		
		return showSuccess($jsonarr);
	}


}
