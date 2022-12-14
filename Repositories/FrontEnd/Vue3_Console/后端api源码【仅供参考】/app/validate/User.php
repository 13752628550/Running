<?php

namespace app\validate;

class User extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'page'=>'require|integer|>:0',
        'id'=>'require|integer|>:0|isExist:true,common\User',
        'status'=>'require|in:0,1',
        'username'=>'require|NotEmpty|length:4,25',
        'password'=>'NotEmpty',
        'repassword'=>'NotEmpty',
        'avatar'=>'url',
        'nickname'=>'chsDash',
		'phone'=>'mobile',
		'email'=>'email',
		'user_level_id|会员等级'=>'require|integer|>=:0|isExist:false,common\UserLevel',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    protected $scene = [
        'index'=>['page'],
        'save'=>['username','password','nickname','phone','email','user_level_id','avatar'],
        'update'=>['id','username','password','nickname','phone','email','user_level_id','avatar'],
        'delete'=>['id'],
        'updateStatus'=>['id','status'],
        "reg"=>['username','password','repassword']
    ];

    // 登录场景
    public function sceneLogin(){
        return $this->only(['password'])
                    ->append('password','checklogin:common\User,userLevel');
    }
}
