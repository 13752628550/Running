<?php

namespace app\validate;

class UserAddresses extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'page'=>'require|integer|>:0',
        'id'=>'require|integer|>:0|isExist:true,common\UserAddresses',
        'name'=>'require',
        'province'=>'require',
        'city'=>'require',
        'district'=>'require',
        'address'=>'require',
        'zip'=>'integer',
        'phone'=>'mobile',
        'default'=>'require|in:0,1'
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
        'save'=>['name','province','city','district','address','zip','phone','default'],
        'update'=>['id','name','province','city','district','address','zip','phone','default'],
        'delete'=>['id']
    ];
}
