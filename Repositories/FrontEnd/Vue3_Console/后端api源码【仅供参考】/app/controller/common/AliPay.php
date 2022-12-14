<?php

namespace app\controller\common;

use think\Request;
use Yansongda\Pay\Pay;
class AliPay
{
    public $alipay;
    // 初始化
    public function __construct(){
        $config = config('cms.payment.alipay');
        $cmsConfig = cmsConfig('alipay');
        $this->alipay = Pay::alipay($config);
    }

    // 网页支付
    public function web($order){
        return $this->alipay->web($order)->send();
    }

    // app支付
    public function app($order){
        return $this->alipay->app($order)->send();
    }
}
