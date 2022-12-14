<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class GoodsSkusCard extends BaseModel
{
    // 关联对应的值
    public function goodsSkusCardValue(){
        return $this->hasMany('GoodsSkusCardValue')->order([ 'order'=>'ASC' ]);
    }
}
