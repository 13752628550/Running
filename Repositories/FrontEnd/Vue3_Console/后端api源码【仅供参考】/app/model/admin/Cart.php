<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class Cart extends BaseModel
{
    // 关联用户
    public function User(){
        return $this->belongsTo(\app\model\common\User::class);
    }

    // 关联goods_skus
    public function goodsSkus(){
        return $this->belongsTo('GoodsSkus','shop_id')->field(['id','image','pprice','oprice','stock','goods_id','skus']);
    }

    // 关联goods
    public function goods(){
        return $this->belongsTo('Goods','shop_id')->field(['id','title','cover','min_price','min_oprice','stock','sku_type','sku_value']);
    }

    // 加入购物车
    public function addCart(){
        $param = request()->param();
        $user = request()->UserModel;
        $data = [
            'user_id'=>$user->id,
            'shop_id'=>(int)$param['shop_id'],
            'skus_type'=>(int)$param['skus_type']
        ];
        // 从数据库中查询该商品是否已经在购物车中
        $cart = $this->where($data)->find();
        // 	不存在：创建一个新的购物车记录
        if (!$cart) {
           $data['num'] = (int)$param['num'];
           $cart = $this->create($data);
        } else{
        	// 	存在：则直接叠加商品数量
        	$cart->num = ['inc',$param['num']];
        	$cart->save();
        }
        $append = $cart->skus_type === 0 ? 'goods' : 'goodsSkus.goods';
        return $cart->append([$append]);
    }

}
