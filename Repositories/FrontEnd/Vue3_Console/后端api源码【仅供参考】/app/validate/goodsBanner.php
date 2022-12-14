<?php

namespace app\validate;

class goodsBanner extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist',
        'url'=>'require|url',
        'goods_id'=>'require|integer|>:0|isExist:false,admin\goods'
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    protected $scene = [
        'save'=>['url','goods_id'],
        'delete'=>['id','goods_id']
    ];
}
