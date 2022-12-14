<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class SysCity extends BaseModel
{
    public function districts(){
        return $this->hasMany('SysDistrict');
    }
}
