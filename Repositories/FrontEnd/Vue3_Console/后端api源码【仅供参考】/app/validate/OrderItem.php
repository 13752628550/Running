<?php

namespace app\validate;

class OrderItem extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist:true,admin\OrderItem',
        'rating'=>'require|integer|>:0|<=:5',
        'review'=>'require|array',
        'page'=>'require|integer',
        'limit'=>'integer',
        'data'=>'require|NotEmpty',
        'status'=>'require|in:0,1',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    protected $scene = [
    	'index'=>['page','limit'],
        'sendReview'=>['id','rating'],
        'review'=>['id','data'],
        'updateStatus'=>['id','status'],
    ];
}
