<?php

namespace app\model\admin;

use app\model\common\BaseModel;
use think\facade\Db;
/**
 * @mixin think\Model
 */
class GoodsType extends BaseModel
{
    // 关联规格值
    public function goodsTypeValues(){
        return $this->hasMany('GoodsTypeValue');
    }

    // 关联skus
    public function skus(){
        return $this->belongsToMany('Skus','SkusGoodsType');
    }


    // 设置skus
    public function setSkus(){
        $skusId = request()->skus_id;
        // 判断是否为空
        if (empty($skusId)) return;
        // 获取当前类型所有属性
        $Ids = SkusGoodsType::where('goods_type_id',$this->id)->field('skus_id')->select();
        // 判断是否已存在
        $arr = [];
        // 数组
        if (is_array($skusId)) {
            foreach ($skusId as $value) {
                // 还未授予
                if ($Ids->where('skus_id',$value)->isEmpty()) $arr[] = $value;
            }
        }else{
            if ($Ids->where('skus_id',$skusId)->isEmpty()) $arr[] = $skusId;
        }
        return count($arr)>0 ? $this->skus()->attach($arr) : true;
    }

    // 删除skus
    public function delSkus($skusId){
        return $this->skus()->detach($skusId);
    }


    // 增加后
    public static function onAfterInsert($goodsType){
    	// 关联创建规格类型值
    	$valueList = request()->param('value_list');
    	$count = is_array($valueList) ? count($valueList) : 0;
    	if ($count > 0) {
    		$GoodsTypeValue = new GoodsTypeValue();
    		for ($i = 0; $i < $count; $i++) {
    			 $valueList[$i]['goods_type_id'] = $goodsType->id;
    		}
    		$GoodsTypeValue->saveAll($valueList);
    	}
        // 关联对应商品规格
        $goodsType->setSkus();
    }

    // 修改前
    public static function onBeforeUpdate($goodsType){
    	// 更新属性
    	$value_list = request()->param('value_list');
    	if ($value_list) {
    		// 清除之前属性
	        $goodsType->goodsTypeValues->delete();
	        // 写入新属性
	        $new_value_list = array_map(function($item){
			    unset($item['id']);
			    return $item;
			},$value_list);
			$goodsType->goodsTypeValues()->saveAll($new_value_list);
    	}
    	// 更新skus
        $skusId = request()->param('skus_id');
        if ($skusId) {
        	// 删除已有skusid
	        SkusGoodsType::where('goods_type_id',$goodsType->id)->delete();
	        $new_skus = array_map(function ($id) use($goodsType){
	        	return [
	        		'skus_id'=>$id,
	        		'goods_type_id'=>$goodsType->id
	        	];
	        },$skusId);
	        Db::name('skus_goods_type')->insertAll($new_skus);
        }
    }

    // 删除后操作
    public static function onAfterDelete($goodsType){
        // 删除该类型下所有类型属性
        $goodsType->goodsTypeValues->each(function($v){
            $v->delete();
        });
        // 删除与sku的关联
        SkusGoodsType::where('goods_type_id',$goodsType->id)->delete();
    }
}
