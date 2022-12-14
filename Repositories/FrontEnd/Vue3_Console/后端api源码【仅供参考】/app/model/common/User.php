<?php

namespace app\model\common;

/**
 * @mixin think\Model
 */
class User extends BaseModel
{

    // 获取当前用户等级
    public function userLevel(){
        return $this->belongsTo('UserLevel');
    }
    
    // 获取当前用户的资料信息
    public function userInfo(){
        return $this->hasOne('UserInfo');
    }

    // 获取当前用户的收货地址列表
    public function userAddresses(){
        return $this->hasMany('UserAddresses');
    }

    // 关联购物车
    public function carts(){
        return $this->hasMany('app\model\admin\Cart');
    }

    // 关联订单
    public function orders(){
        return $this->hasMany('app\model\admin\Order');
    }


    // 关联优惠券
    public function CouponUser(){
        return $this->hasMany('app\model\admin\CouponUser');
    }

    // 密码自动加密
    public function setPasswordAttr($value,$data){
        return password_hash($value,PASSWORD_DEFAULT);
    }

	
	// 验证用户名是什么格式，昵称/邮箱/手机号
    public function filterLoginMethod($data){
        // 验证是否是手机号码
        if(preg_match('^1(3|4|5|7|8)[0-9]\d{8}$^', $data)){
            return 'phone';
        }
        
        if (preg_match('/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/', $data)) {
        	// 验证是否是邮箱
        	return 'email';
        }
        
        return 'username';
    }

	// 验证唯一性
	public function checkUnique($key,$msg){
		$data = request()->param($key);
    	// 唯一性验证
    	$user = $this->where($key,$data)->find();
    	if($user){
    		ApiException( $msg.'已经存在');
    	}
	}

    // 创建之后
    public static function onAfterInsert($user){
        // 创建会员资料
        UserInfo::create([
            'user_id'=>$user->id
        ]);
    }
    // 删除之后
    public static function onAfterDelete($user){
        $user->userInfo->delete();
    }
}
