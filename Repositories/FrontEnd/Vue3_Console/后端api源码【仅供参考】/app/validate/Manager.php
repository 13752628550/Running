<?php

namespace app\validate;

class Manager extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'page' => 'require|integer|>:0',
        'id'=>'require|integer|>:0|isExist',
        'username'=>'require|NotEmpty|unique:manager',
        'password'=>'alphaDash',
        'status'=>'require|in:0,1',
        'role_id'=>'require|integer|>:0|isExist:false,admin\Role',
        'rule_id'=>'require|integer|>:0|isExist:false,admin\Role',
        "oldpassword|旧密码"=>"require",
        "repassword|确认密码"=>"require",
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    protected $scene = [
        'read'=>['id'],
        'index'=>['page'],
        'save'=>['username','password','status','role_id'],
        'delete'=>['id'],
        'updateStatus'=>['id','status'],
        'setRole'=>['id','role_id'],
        'hasRule'=>['rule_id'],
        "updatepassword"=>["oldpassword","password","repassword"]
    ];
    // 修改管理员场景
    public function sceneUpdate(){
        $id = request()->param('id');
        return $this->only(['id','username','password','status','role_id'])
                    ->remove('username','unique:manager')
                    ->append('username','unique:manager,username,'.$id);
    }
    // 登录场景
    public function sceneLogin(){
        return $this->only(['password'])
                    ->append('password','checklogin');
    }
}
