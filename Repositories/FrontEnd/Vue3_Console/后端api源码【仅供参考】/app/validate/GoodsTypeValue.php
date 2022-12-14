<?php

namespace app\validate;

class GoodsTypeValue extends BaseValidate
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
        'status'=>'require|in:0,1',
        'name'=>'require',
        'order'=>'integer|>=:0',
        'type'=>'require|in:input,radio,checkbox',
        'goods_type_id'=>'require|integer|>=:0|isExist:false,admin\goodsType'
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
        'save'=>['name','status','goods_type_id','order','type'],
        'update'=>['id','name','status','goods_type_id','order','type'],
        'delete'=>['id'],
        'updateStatus'=>['id','status'],
        'checkList'=>['name','status','order','type','default'],
    ];
}
