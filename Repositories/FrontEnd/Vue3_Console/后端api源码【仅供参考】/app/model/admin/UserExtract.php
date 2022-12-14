<?php

namespace app\model\admin;

use app\model\common\BaseModel;
/**
 * @mixin think\Model
 */
class UserExtract extends BaseModel
{
	// 关联用户
	public function user(){
		return $this->belongsTo(\app\model\common\User::class)->hidden(['password']);
	}
}
