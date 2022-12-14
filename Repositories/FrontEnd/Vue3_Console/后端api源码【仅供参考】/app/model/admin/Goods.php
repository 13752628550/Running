<?php

namespace app\model\admin;

use app\model\common\BaseModel;
use think\model\concern\SoftDelete;
/**
 * @mixin think\Model
 */
class Goods extends BaseModel
{

    // 设置json类型字段
    protected $json = ['sku_value'];
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    
    // 转化json字段
    public function setSkuValueAttr($value,$data){
        if (!empty($value)) {
            return [
                "oprice" => floatval($value['oprice']),
                "pprice" => floatval($value['pprice']),
                "cprice" => floatval($value['cprice']),
                "weight" => intval($value['weight']),
                "volume" => intval($value['volume']),
            ];
        }
    }
    
    // 关联详细订单
    // public function orderItems(){
    // 	return $this->hasMany('OrderItem');
    // }
    
    // 关联分类
    public function category(){
    	return $this->belongsTo('Category');
    }
    
    // 关联评论
    public function comments(){
        // return $this->hasMany('Comment');
        return $this->hasMany('OrderItem')->whereNotNull('rating');
    }
    
    // 关联规格信息
    public function goodsSkus(){
        return $this->hasMany('GoodsSkus'); 
    }

    // 商品规格卡片
    public function goodsSkusCard(){
        return $this->hasMany('GoodsSkusCard')->order([
        	'order'=>'ASC'
        ]);
    }

    // 商品属性
    public function goodsAttrs(){
        return $this->hasMany('GoodsAttrs');
    }

    // 关联商品轮播图
    public function goodsBanner(){
        return $this->hasMany('goodsBanner');
    }

	// 热门商品列表
	public function hotList(){
		return $this->field(['id','title','cover','desc','min_price','min_oprice'])->order('sale_count','desc')->limit(6)->select();
	}

    // 更新商品属性
    public function updateGoodsAttrs($goods,$isUpate = false){
        $param = request()->param();
        if (!array_key_exists('goods_attrs',$param)) return;
        $count = $param['goods_attrs'];
        if ($count > 0) {
            $add = [];
            foreach ($param['goods_attrs'] as $k => $v) {
                $add[$k] = [
                    "goods_id"=>$goods->id,
                    "order" => getValByKey('order',$v,50),
                    "value" => getValByKey('value',$v,''),
                    "name" =>  getValByKey('name',$v,''),
                    "default" =>  getValByKey('default',$v,''),
                    "type" =>  getValByKey('type',$v,0)  
                ]; 
                // 更新操作
                $id = getValByKey('id',$v,false);
                if ($isUpate && $id) {
                    $add[$k]['id'] = $id;
                }
            }
            if (!empty($add)) {
                $goods->goodsAttrs()->saveAll($add);
            }
        }
    }


    // 创建之后
    public static function onAfterInsert($goods){
        // 关联商品规格卡片
        // $param = request()->param();
        // $Card = goodsSkusCard::where([
        //     ['id','in',$param['goods_skus_card_ids']],
        //     ['goods_id','=',0]
        // ])->select();
        // $Card->each(function($v) use($goods){
        //     $v->goods_id = $goods->id;
        //     $v->save();
        // });
        // 增加商品属性
        //$goods->updateGoodsAttrs($goods);
        // 写入商品规格
        //$goods->goodsSkus()->saveAll(request()->goods_skus);
    }

    // 更新之前
    public static function onBeforeUpdate($goods){
        
    }

    // 更新之后
    public static function onAfterUpdate($goods){
         // 更新商品属性
         //$goods->updateGoodsAttrs($goods,true);
         // 清除之前商品规格
         //if ($goods->goodsSkus) {
         //   $goods->goodsSkus->each(function($v){
         //       $v->delete();
         //    });
         //}
         // 添加现有规格
         //if (request()->goods_skus) {
         //   $goods->goodsSkus()->saveAll(request()->goods_skus);
         //}
    }

    // 删除之后
    public static function onAfterDelete($goods){
        // 删除对应的goods_skus_card
        $goods->goodsSkusCard->each(function($v){
            $v->delete();
        });
    }
}
