<?php

namespace app\model\admin;

use think\Model;

/**
 * @mixin think\Model
 */
class Comment extends Model
{
    protected $json = ['imglist'];

    public function user(){
        return $this->belongsTo(\app\model\common\User::class);
    }
}
