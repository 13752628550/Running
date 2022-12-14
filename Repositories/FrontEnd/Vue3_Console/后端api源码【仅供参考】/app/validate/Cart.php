<?php

namespace app\validate;

class Cart extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist:true,admin\Cart',
        'skus_type|规格类型' =>'require|in:0,1',
        'num|商品数量'=>'require|integer|>:0',
        'shop_id'=>'require|integer|>:0|checkShopId',
        'shop_ids'=>'require'
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    protected $scene = [
        'update'=>['id','num','shop_id'],
        'save'=>['skus_type','num','shop_id'],
        'delete'=>['shop_ids'],
        'read'=>['id']
    ];
    
    public function sceneUpdateNumber(){
        return $this->only(['id','num'])
                    ->append('num','checkNumber');
    }
    
    protected function checkNumber($value, $rule, $data='', $field=''){
    	$cart = request()->Model;
    	return $this->checkGoodsSkus($cart->shop_id,$cart->skus_type,$value);
    }
    
    // 验证商品
    protected function checkShopId($value, $rule, $data='', $field=''){
        // 判断是新增还是修改
        $skusType = array_key_exists('id',$data) ? request()->Model->skus_type : (int)$data['skus_type'];
        return $this->checkGoodsSkus($value,$skusType,$data['num']);
    }

}
