<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class GoodsSkus extends BaseModel
{
    protected $json = ['skus'];

    // 关联商品
    public function goods(){
        return $this->belongsTo('goods')->field(['id','title','cover','min_price','min_oprice','stock','sku_type','sku_value','status','ischeck']);
    }
}
