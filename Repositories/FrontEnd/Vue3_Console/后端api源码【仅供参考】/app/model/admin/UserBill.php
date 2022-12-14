<?php

namespace app\model\admin;

use app\model\common\BaseModel;
/**
 * @mixin think\Model
 */
class UserBill extends BaseModel
{
    // 关联订单
    public function order(){
        return $this->belongsTo('Order');
    }

	// 关联用户
	public function user(){
		return $this->belongsTo(\app\model\common\User::class)->hidden(['password']);
	}
}
