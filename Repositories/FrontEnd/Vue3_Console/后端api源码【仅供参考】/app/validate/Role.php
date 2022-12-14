<?php

namespace app\validate;

class Role extends BaseValidate
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
        'status'=>'require|in:0,1',
        'name'=>'require',
        'rule_ids'=>'array'
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
        'save'=>['status','name'],
        'update'=>['id','status','name'],
        'delete'=>['id'],
        'updateStatus'=>['id','status'],
        'setRules'=>['id','rule_ids'],
        'delRules'=>['id','rule_ids']
    ];
}
