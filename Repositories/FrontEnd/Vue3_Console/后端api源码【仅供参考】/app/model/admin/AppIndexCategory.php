<?php

namespace app\model\admin;

use app\model\common\BaseModel;

class AppIndexCategory extends BaseModel
{
    public function indexData(){
        return $this->hasMany('appIndexData');
    }
}
