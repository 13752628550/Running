<?php

namespace app\controller\common;

use think\Request;
use app\controller\common\Base;
// use app\controller\common\AlipayPayment;
use app\controller\common\WxpayPayment;
use Yansongda\Pay\Pay;
class Payment extends Base
{
    protected $autoNewModel = false;

    protected $excludeValidateCheck = ['alipayReturn','alipayNotify','wechatNotify'];

    // 支付宝支付
    public function payByAlipay(){
        // 验证当前订单是否为该用户
        $user = request()->UserModel;
        $order = request()->Model;
        if ($user->id !== $order->user_id) {
            ApiException('非法操作');
        }
        // 当前订单是否已经支付过
        if ($order->paid_time || $order->closed) {
            ApiException('订单状态不正确');
        }
        
        $alipay = new AliPay;
        return $alipay->app([
            'out_trade_no' => $order->no, // 订单编号，需保证在商户端不重复
            'total_amount' => $order->total_price, // 订单金额，单位元，支持小数点后两位
            'subject'      => '支付ShopAdmin的订单：'.$order->no, // 订单标题
            'body'      => '支付ShopAdmin的订单：'.$order->no, 
        ]);
        
    }

    // 前端回调
    public function alipayReturn(){
        $obj = new AliPay;
        try {
            $data = $obj->alipay->verify(request()->param());
        } catch (\Exception $e) {
            ApiException('数据不正确');
        }
        return showSuccess('付款成功');
    }
    
    // 服务端回调
    public function alipayNotify(){
        $obj = new AliPay;
        $alipay = $obj->alipay;
        trace('[支付宝alipayNotify] 拿到支付宝实例','info');
        // 校验输入参数
        $data = $alipay->verify(request()->param());
        trace('[支付宝alipayNotify] 获取到参数'.$data,'info');
        // 如果订单状态不是成功或者结束，则不走后续的逻辑
        // 所有交易状态：https://docs.open.alipay.com/59/103672
        if(!in_array($data->trade_status, ['TRADE_SUCCESS', 'TRADE_FINISHED'])) {
            trace('[支付宝alipayNotify] 订单状态不是成功或者结束'.$data,'error');
            return $alipay->success()->send();
        }
        // $data->out_trade_no 拿到订单流水号，并在数据库中查询
        $order = \app\model\admin\Order::where('no', $data->out_trade_no)->find();

        if (!$order) {
            trace('[支付宝alipayNotify] 订单不存在'.$data,'error');
            return 'fail';
        }

        // 如果这笔订单的状态已经是已支付
        if ($order->paid_time) {
            trace('[支付宝alipayNotify] 这笔订单的状态已经是已支付'.$data,'error');
            // 返回数据给支付宝
            return $alipay->success()->send();
        }
        // 更新订单状态
        $order->paid_time = time();
        $order->payment_method = 'alipay';
        $order->payment_no = $data->trade_no;
        $order->save();

        // 支付成功后的操作
        $this->afterPay($order);

        trace('[支付宝alipayNotify] 成功'.$data,'info');
        return $alipay->success()->send();
    }

	// 微信小程序支付
	public function payByWechatMp(){
		$code = request()-> param('code');
		if(!$code){
			ApiException('code不能为空');
		}
		// 验证当前订单是否为该用户
        $user = request()->UserModel;
        $order = request()->Model;
        if ($user->id !== $order->user_id) {
            ApiException('非法操作');
        }
        // 当前订单是否已经支付过
        if ($order->paid_time || $order->closed) {
            ApiException('订单状态不正确');
        }
        // 获取openid
        $openid = $this->getOpenId($code);
        // 调用支付
        $wechat = new wechatPay;
    //     halt([
    //     	'out_trade_no' => $order->no, // 订单编号，需保证在商户端不重复
		  //  'body' => '支付ShopAdmin的订单：'.$order->no, // 订单标题
		  //  'total_fee' => strval($order->total_price*100), // 订单金额，单位分，支持小数点后两位
		  //  'openid' => $openid,
    //     ]);
        return $wechat->miniapp([
        	'out_trade_no' => $order->no, // 订单编号，需保证在商户端不重复
		    'body' => '支付ShopAdmin的订单：'.$order->no, // 订单标题
		    'total_fee' => strval($order->total_price*100), // 订单金额，单位分，支持小数点后两位
		    'openid' => $openid,
        ]);
	}
	
	// 获取openid
	public function getOpenId($code){
        $url = "https://api.weixin.qq.com/sns/jscode2session";
        // 参数
        $params['appid']= config('cms.wx.appid');
        $params['secret']=  config('cms.wx.secret');
        $params['js_code']= $code;
        $params['grant_type']= 'authorization_code';
        // 微信API返回的session_key 和 openid
        $arr = httpWurl($url, $params, 'POST');
        $arr = json_decode($arr,true);
        // 不成功
        if(isset($arr['errcode']) && !empty($arr['errcode'])){
            ApiException($arr['errmsg']);
        }
        // 拿到数据
        return $arr['openid'];
    }

    // 微信支付
    public function payByWechat(){
        // 验证当前订单是否为该用户
        $user = request()->UserModel;
        $order = request()->Model;
        if ($user->id !== $order->user_id) {
            ApiException('非法操作');
        }
        // 当前订单是否已经支付过
        if ($order->paid_time || $order->closed) {
            ApiException('订单状态不正确');
        }
        // 调用支付
        $wechat = new wechatPay;
        return $wechat->app([
        	'out_trade_no' => $order->no, // 订单编号，需保证在商户端不重复
		    'body' => '支付ShopAdmin的订单：'.$order->no, // 订单标题
		    'total_fee' => strval($order->total_price*100), // 订单金额，单位分，支持小数点后两位
        ]);
        
      //  $wechat = new WxpayPayment;
      //  return $wechat->pay([
      //  	'out_trade_no' => $order->no, // 订单编号，需保证在商户端不重复
		    // 'body' => '支付ShopAdmin的订单：'.$order->no, // 订单标题
		    // 'total_fee' => $order->total_price, // 订单金额，单位分，支持小数点后两位
      //  ]);
        
    }

    
    /**
     * 微信支付回调
     * @param Request $request
     */
    public function wechatNotify(Request $request){
    	trace('[微信支付回调] 回调开始','info');
        //TODO 此代码 是因为 php7之后的版本中已经弃用 HTTP_RAW_POST_DATA，所以...
        $xml=isset($GLOBALS['HTTP_RAW_POST_DATA'])
            ? $GLOBALS['HTTP_RAW_POST_DATA'] : file_get_contents("php://input");
            
        //将服务器返回的XML数据转化为数组
        $data = self::xml2array($xml);
        if (($data['return_code'] == 'SUCCESS') && ($data['result_code'] == 'SUCCESS')) {
        	trace('[微信支付回调] 支付成功开始处理回调','info');
        	
            // //获取服务器返回的数据
            // $out_trade_no = $data['out_trade_no'];            //订单单号
            // $data['timestamp'] = date("Y-m-d H:i:s");
            // $json_str_notify = json_encode($data);
			$out_trade_no = $data['out_trade_no'];
			$order = \app\model\admin\Order::where('no', $out_trade_no)->find();
		    if ($order) {
		    	// 如果这笔订单的状态已经是已支付
		        if (!$order->paid_time) {
		        	// 更新订单状态
			        $order->paid_time = time();
			        $order->payment_method = 'wechat';
			        $order->payment_no = $out_trade_no;
			        $order->save();
			        trace('[微信支付回调] 成功','info');
		        }
		    } else {
		    	trace('[微信支付回调] 订单不存在'.$out_trade_no,'error');
		    }
        } else {
        	trace('[微信支付回调] 支付失败','info');
        }
    }
    /**
     * 将xml转为array
     * @param  string $xml xml字符串
     * @return array    转换得到的数组
     */
    protected function xml2array($xml)
    {
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        $result = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $result;
    }


    // 支付成功后操作
    public function afterPay($order){
        // 商品增加销量
        $this->addSaleCount($order);
    }

    // 增加商品销量
    public function addSaleCount($order){
        // 获取当前订单对应商品
        $orderItems = $order->orderItems;
        $orderItems->each(function($item){
            // 需要增加的销量
            $count = $item->num;
            // 获取每个订单的商品
            $goods = $item->skus_type === 1 ? $item->goodsSkus->goods : $item->goods;
            // 更新商品销量
            $goods->sale_count += $count;
            $goods->save();
        });
    }
}
