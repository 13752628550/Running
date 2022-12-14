<?php

namespace app\validate;

class AppIndexCategory extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist:true,admin\appIndexCategory',
        'page'=>'require|integer|>:0',
        'name'=>'require',
        'order'=>'integer',
        'template'=>'require|in:index,special',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    protected $scene = [
        'index'=>[],
        'read'=>['id','page'],
        'save'=>['name','order','template'],
        'delete'=>['id'],
    ];
}
