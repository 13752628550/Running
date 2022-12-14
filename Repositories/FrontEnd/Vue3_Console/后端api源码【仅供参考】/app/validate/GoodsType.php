<?php

namespace app\validate;
use think\exception\ValidateException;
class GoodsType extends BaseValidate
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
        'skus_id'=>'array|removeNoExist:admin\Skus',
        'value_list'=>'array|checkValueList',
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
        'save'=>['name','status','order','skus_id','value_list'],
        'update'=>['id','name','status','order','skus_id'],
        'delete'=>['id'],
        'updateStatus'=>['id','status'],
        'deleteAll'=>['ids']
    ];
    
    protected function checkValueList($value, $rule='', $data='', $field='')
    {
    	$validate = new \app\validate\GoodsTypeValue();
    	$error = false;
    	foreach ($value as $item) {
    		if(!$validate->scene('checkList')->check($item)){
    			$error = $validate->getError();
    		}
    	}
    	if($error){
    		return $error;
    	}
        return true;
    }
}
