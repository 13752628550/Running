<?php

namespace app\validate;

class AppCategoryItem extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist:true,admin\AppCategoryItem',
        'category_id'=>'require|integer|>:0',
        'page'=>'require|integer|>:0',
        'goods_ids'=>'require|array',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    protected $scene = [
        'index'=>['category_id'],
        'save'=>['goods_ids','category_id'],
        'delete'=>['id'],
    ];
}
