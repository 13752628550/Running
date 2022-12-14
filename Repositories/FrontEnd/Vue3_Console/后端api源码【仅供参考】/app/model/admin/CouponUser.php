<?php

namespace app\model\admin;

use app\model\common\BaseModel;
/**
 * @mixin think\Model
 */
class CouponUser extends BaseModel
{
    // 关联用户
    public function user(){
        return $this->belongsTo(\app\model\common\User::class);
    }
    // 关联优惠券
    public function coupon(){
        return $this->belongsTo('Coupon');
    }

    // 新增时（领取后，更新优惠券表领取人数）
    public static function onAfterInsert($CouponUser){
        $CouponUser->coupon->used += 1;
        $CouponUser->coupon->save();
    }

    // 修改优惠券使用状态
    public function changeUsed($used = 0){
        $this->used = $used;
        return $this->save();
    }
}
