<?php

namespace app\validate;

class GoodsSkusCard extends BaseValidate
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
        'goods_id'=>'require|integer|>=:0|isExist:false,admin\Goods',
        'name'=>'require|NotEmpty',
        'type'=>'require|in:0,1,2',
        'order'=>'require|integer|>:0',	
        'sortdata'=>'require|array',
        "value"=>"require|array"
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

        'save'=>['goods_id','name','type','order'],

        'update'=>['id','goods_id','name','type','order'],

        'delete'=>['id'],
        
        'sort'=>['sortdata'],
        
        'set'=>['id','name','value']
    ];
}
