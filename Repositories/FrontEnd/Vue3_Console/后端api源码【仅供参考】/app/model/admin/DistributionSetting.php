<?php

namespace app\model\admin;

use app\model\common\BaseModel;
/**
 * @mixin think\Model
 */
class DistributionSetting extends BaseModel
{
    public function setSpreadBannersAttr($value,$data){
        return implode(",",$value);
    }
}
