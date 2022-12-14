<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class SysProvince extends BaseModel
{
    public function citys(){
        return $this->hasMany('SysCity');
    }
}
