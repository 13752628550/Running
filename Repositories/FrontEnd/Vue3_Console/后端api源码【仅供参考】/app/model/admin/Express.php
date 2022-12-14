<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class Express extends BaseModel
{
    public function expressValues(){
        return $this->hasMany('ExpressValue');
    }
}
