<?php

namespace app\validate;

class SkusValue extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist',
        'page'=>'require|integer|>:0',
        'name'=>'require|NotEmpty',
        'value'=>'require|NotEmpty',
        'skus_id'=>'require|integer|>=:0|isExist:false,admin\Skus'
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
        'save'=>['name','value','skus_id'],
        'update'=>['id','name','value','skus_id'],
        'delete'=>['id']
    ];
}
