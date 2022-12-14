<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class OrderItem extends BaseModel
{
    protected $json = ['review','extra'];
	protected $jsonAssoc = true;
	public function getReviewTimeAttr($value){
		return date('Y-m-d H:i:s', $value); 
	}

    // 关联订单
    public function order(){
        return $this->belongsTo('Order');
    }

	// 关联用户
	public function user(){
		return $this->belongsTo(\app\model\common\User::class)->hidden(['password']);
	}

    // 关联goods
    public function goods(){
        return $this->belongsTo('goods','shop_id');
    }

    // 关联goods_skus
    public function goodsSkus(){
        return $this->belongsTo('goodsSkus','shop_id');
    }
    
    // 关联商品
    public function goodsItem(){
    	return $this->belongsTo('goods','goods_id');
    }
}
