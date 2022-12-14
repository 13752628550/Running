<?php

namespace app\validate;

class Image extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'page' => 'require|integer|>:0',
        'id'=>'require|integer|>:0|isExist',
        'image_class_id|相册'=>'integer|>=:0|isExist:false,admin\ImageClass',
        'name'=>'require|NotEmpty',
        'ids'=>'require|array'
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
        'save'=>['image_class_id'],
        'update'=>['id','name'],
        'delete'=>['id'],
        'deleteAll'=>['ids']
    ];
}
