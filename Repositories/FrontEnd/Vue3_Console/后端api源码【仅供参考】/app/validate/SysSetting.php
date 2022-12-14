<?php

namespace app\validate;

use think\Validate;

class SysSetting extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
		'open_reg'=>'in:0,1',
		'reg_method'=>'in:username,phone',
		'password_min'=>'integer|>:0',
		'upload_method'=>'in:local,oss',
		'api_safe'=>'in:0,1',
		'close_order_minute'=>'integer|>=:0',
		'auto_received_day'=>'integer|>=:0',
		'after_sale_day'=>'integer|>=:0',
	];
    
    
    protected $scene = [
    	'set'=>['open_reg','reg_method','password_min','upload_method','api_safe','close_order_minute','auto_received_day','after_sale_day']
    ];
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];
}
