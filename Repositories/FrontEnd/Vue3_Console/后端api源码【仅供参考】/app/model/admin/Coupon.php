<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class Coupon extends BaseModel
{
	protected $globalScope = ['orderId'];
	
	public function getStartTimeAttr($value)
    {
        return date("Y-m-d H:i:s",$value);
    }
    public function getEndTimeAttr($value)
    {
        return date("Y-m-d H:i:s",$value);
    }
	
	public function scopeOrderId($query)
    {
        $query->order('id','desc');
    }
	
    // 关联领取情况
    public function CouponUser(){
        return $this->hasMany('CouponUser');
    }

}
