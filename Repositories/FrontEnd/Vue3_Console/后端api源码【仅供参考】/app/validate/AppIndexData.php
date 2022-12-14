<?php

namespace app\validate;

class AppIndexData extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'app_index_category_id'=>'require|integer|>:0|isExist:false,admin\AppIndexCategory',
	    'id'=>'require|integer|>:0|isExist:true,admin\AppIndexData',
	    'data'=>'require',
	    'sortdata'=>'require',
	    'type'=>'require|in:swiper,indexnavs,threeAdv,oneAdv,list',
	    'order'=>'require|integer',
	];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];
    
    protected $scene = [
        'index'=>['app_index_category_id'],
        'save'=>['type','order','data','app_index_category_id'],
        'update'=>['id','data'],
        'sortData'=>['sortdata'],
        'delete'=>['id'],
    ];
}
