<?php

namespace app\validate;

class GoodsSkusCardValue extends BaseValidate
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
        'goods_skus_card_id'=>'require|integer|>=:0|isExist:false,admin\GoodsSkusCard',
        'name'=>'require|NotEmpty',
        'value'=>'NotEmpty',	
        'order'=>'require|integer|>:0',	
        'sortdata'=>'require|array',	
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

        'save'=>['name','value','order','goods_skus_card_id'],

        'update'=>['id','name','value','order','goods_skus_card_id'],

        'delete'=>['id'],
        
        'sort'=>['sortdata']
    ];
}
