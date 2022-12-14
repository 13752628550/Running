<?php

namespace app\validate;

class Invoice extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist:true,admin\Invoice',
        'page'=>'require|integer|>:0',
        'limit'=>"integer",
        'ids'=>'require|array'
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    // 场景
    protected $scene = [
        'index'=>['page','limit'],
        'update'=>['id'],
        'deleteAll'=>['ids']
    ];

}
