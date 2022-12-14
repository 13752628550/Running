<?php

namespace app\controller\common;

use think\Request;

class WxpayPayment
{
    // 支付实例
    protected $wechat = null;
    // 异步通知地址
    protected $notify_url = null;
    // 初始化
    public function __construct()
    {
        // 引入
        $path = __DIR__.'/../../../extend/wxpayv3';
        include_once($path.'/WxPay.Api.php');
        include_once($path.'/WxPay.Data.php');
    }
    
    // 支付
    public function pay($params){
        $total = floatval(getValByKey('total_fee',$params,1));
        $total = round($total*100);

        // 商品名称
        $subject = getValByKey('body',$params,'标题');
        // 订单号，示例代码使用时间值作为唯一的订单ID号
        $out_trade_no = getValByKey('out_trade_no',$params,date('YmdHis', time()));

        $unifiedOrder = new \WxPayUnifiedOrder();
        $unifiedOrder->SetBody($subject);//商品或支付单简要描述
        $unifiedOrder->SetOut_trade_no($out_trade_no);
        $unifiedOrder->SetTotal_fee($total);
        $unifiedOrder->SetTrade_type("APP");
        $result = \WxPayApi::unifiedOrder($unifiedOrder);
        if (is_array($result)) {
            return showSuccess(json_encode($result));
        }
    }
}
