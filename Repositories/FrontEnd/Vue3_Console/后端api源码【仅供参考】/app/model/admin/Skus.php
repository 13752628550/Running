<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class Skus extends BaseModel
{
    // 关联规格值
    public function skusValues(){
        return $this->hasMany('SkusValue');
    }

    // 删除后操作
    public static function onAfterDelete($skus){
        // 删除该规格下的所有规格值
        // $skus->skusValues->each(function($v){
        //     $v->delete();
        // });
        
        SkusGoodsType::where('skus_id',$skus->id)->delete();
    }
}
