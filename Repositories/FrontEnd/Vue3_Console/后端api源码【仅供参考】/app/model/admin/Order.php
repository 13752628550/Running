<?php

namespace app\model\admin;

use app\model\common\BaseModel;

class Order extends BaseModel
{
    // 只读字段
    protected $readonly = ['no'];

    // 定义json字段
    protected $json = ['address','ship_data','extra'];

    // 退款状态地图
    public static $refundStatusMap = [
        'pending'=>'未退款',
        'applied'=>'已申请退款',
        'processing'=>'退款中',
        'success'=>'退款成功',
        'failed'=>'退款失败',
    ];

    // 物流状态地图
    public static $shipStatusMap = [
        'pending'=>'未发货',
        'delivered'=>'已发货',
        'received'=>'已收货',
    ];

	// 全部
    public function scopeAll($query)
    {
        $query->where('closed',0);
    }
	// 待支付
    public function scopePaying($query)
    {
        $query->whereNull('paid_time')
              ->where('closed',0);
    }
    // 待收货
    public function scopeReceiving($query)
    {
        $query->whereNotNull('paid_time')
              ->where([
                ['ship_status','<>','received'],
                ['closed','=',0]
            ]);
    }
    // 待评价
    public function scopeReviewing($query)
    {
        $query->whereNotNull('paid_time')
              ->where([
                ['ship_status','=','received'],
                ['reviewed','=',0],
                ['closed','=',0]
            ]);
    }

    // 关联订单商品
    public function orderItems(){
        return $this->hasMany('OrderItem');
    }

    // 关联优惠券
    public function couponUser(){
        return $this->hasOne('CouponUser');
    }
    
    // 关联优惠券
    public function couponUserItem(){
        return $this->belongsTo('CouponUser');
    }

    // 关联用户
    public function user(){
        return $this->belongsTo(\app\model\common\User::class);
    }

    // 关联收货地址
    public function userAddresses(){
        return $this->belongsTo('userAddresses');
    }

    // 初始化物流状态
    public function setShipStatusAttr($value){
        if (empty($value)) {
            return 'pending';
        }
        return $value;
    }
    // 初始化退款状态
    public function setRefundStatusAttr($value){
        if (empty($value)) {
            return 'pending';
        }
        return $value;
    }

    // 自动生成订单号
    public static function setOrderNo(){
        // 订单流水号前缀
        $prefix = date('YmdHis');
        for ($i = 0; $i < 10; $i++) {
            // 随机生成 6 位的数字
            $no = $prefix.str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            // 判断是否已经存在
            if (!self::where('no', $no)->find()) {
                return $no;
            }
        }
        return false;
    }

    // 生成退款单号
    public static function setRefundOrderNo(){
        do {
            $prefix = 'refund'.date('YmdHis');
            // 随机生成 6 位的数字
            $no = $prefix.str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
        } while (self::where('refund_no',$no)->find());
        return $no;
    }

    // 减库存
    public function decStock($num,$goodsModel){
        if ($num < 0) {
            ApiException('减库存不可小于0');
        }
        if ($goodsModel->stock >= $num) {
            $goodsModel->stock -= $num;
            return $goodsModel->save();
        }
    }
    // 加库存
    public function addStock($num,$goodsModel){
        if ($num < 0) {
            ApiException('减库存不可小于0');
        }
        $goodsModel->stock += $num;
        return $goodsModel->save();
    }

    // 写入之前自动生成订单号
    public static function onBeforeInsert($order){
        // 生成订单流水号
        $order->no = static::setOrderNo();
        // 如果生成失败，则终止创建订单
        if (!$order->no) {
           ApiException('创建订单失败');
        }
    }

    // 计算优惠后金额
    public function getPriceByCoupon($price){
        $coupon = request()->coupon;
        trace('[计算优惠后金额]获取当前优惠券实例', 'info');
        if (!$coupon['value']) {
        	trace('[计算优惠后金额]value值不存在，直接返回原来的价格', 'info');
            return $price;
        }
        // 固定金额
        if ($coupon['type'] == 0) {
            // 订单金额最少为 0.01 元
            trace('[计算优惠后金额][满减]，开始满减', 'info');
            $result = max(0.01,$price - $coupon['value']);
            trace('[计算优惠后金额][满减]，计算结果：'.$result, 'info');
            return $result;
        } else {
        	// 百分比
	        $result = number_format($price * (10 - $coupon['value']) / 10, 2, '.', '');
	        trace('[计算优惠后金额][折扣]，计算结果：'.$result, 'info');
	        return $result;
        }
    }

}
