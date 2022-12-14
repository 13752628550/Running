<?php

namespace app\controller\common;

use think\Request;
use Yansongda\Pay\Pay;
class wechatPay
{
    public $wechat;

    public function __construct(){
        $config = config('cms.payment.wechat');
        $cmsConfig = cmsConfig('wxpay');
        
        $this->wechat = Pay::wechat($config);
    }

    // 扫码支付
    public function scan($order){
        return $this->wechat->scan($order)->send();
    }

    // app支付
    public function app($order){
        return $this->wechat->app($order)->send();
    }
    
    // 小程序支付
    public function miniapp($order){
    	return $this->wechat->miniapp($order);
    }
    
    // 公众号支付
    public function mp($order){
    	return $this->wechat->mp($order)->send();
    }
}
