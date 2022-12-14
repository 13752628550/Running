<?php

namespace app\validate;

class ExpressValue extends BaseValidate
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
        'express_id'=>'require|integer|>=:0|isExist:false,admin\Express',
        'region'=>'require|array',
        'first'=>'require|integer|>=:0',
        'first_price'=>'require|float|>=:0',
        'add'=>'require|integer|>=:0',
        'add_price'=>'require|float|>=:0',
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
        'save'=>['express_id','region','first','first_price','add','add_price'],
        'update'=>['id','express_id','region','first','first_price','add','add_price'],
        'delete'=>['id'],
    ];
}
