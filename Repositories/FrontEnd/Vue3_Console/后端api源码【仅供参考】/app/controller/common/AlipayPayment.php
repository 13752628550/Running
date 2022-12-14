<?php

namespace app\controller\common;

use think\Request;

class AlipayPayment
{
    // 支付实例
    protected $alipay = null;
    // 异步通知地址
    protected $notify_url = null;
    // 初始化
    public function __construct()
    {
        // 引入
        $path = __DIR__.'/../../../extend/alipayrsa2/aop';
        include_once($path.'/AopClient.php');
        include_once($path.'/request/AlipayTradeAppPayRequest.php');
        // 参数配置
        $aop = new \AopClient;
        $aop->gatewayUrl = "https://openapi.alipay.com/gateway.do";
        $aop->appId = config('cms.payment.alipay.app_id');
        $aop->rsaPrivateKey = config('cms.payment.alipay.private_key');
        $aop->format = "json";
        $aop->charset = "UTF-8";
        $aop->signType = "RSA2";
        $aop->alipayrsaPublicKey = config('cms.payment.alipay.ali_public_key');

        $this->alipay = $aop;
        // $this->notify_url = urlencode(url('alipayNotify'));
        $this->notify_url = config('cms.payment.alipay.notify_url');
    }
    
    // 支付宝支付
    public function pay($params){
        // 获取支付金额
        $total = getValByKey('total_amount',$params,'0.01');
        // 订单标题
        $subject = getValByKey('subject',$params,'标题');
        // 订单详情
        $body = getValByKey('body',$params,'测试项目订单详情');
        // 订单号，示例代码使用时间值作为唯一的订单ID号
        $out_trade_no = getValByKey('out_trade_no',$params,date('YmdHis', time()));

        //SDK已经封装掉了公共参数，这里只需要传入业务参数
        $bizcontent = "{\"body\":\"".$body."\","
                        . "\"subject\": \"".$subject."\","
                        . "\"out_trade_no\": \"".$out_trade_no."\","
                        . "\"timeout_express\": \"30m\","
                        . "\"total_amount\": \"".$total."\","
                        . "\"product_code\":\"QUICK_MSECURITY_PAY\""
                        . "}";
        //实例化具体API对应的request类
        $request = new \AlipayTradeAppPayRequest();
        $request->setNotifyUrl($this->notify_url);
        $request->setBizContent($bizcontent);
        //这里和普通的接口调用不同，使用的是sdkExecute
        $response = $this->alipay->sdkExecute($request);

        // 注意：这里不需要使用htmlspecialchars进行转义，直接返回即可
        return showSuccess($response);
    }
}
