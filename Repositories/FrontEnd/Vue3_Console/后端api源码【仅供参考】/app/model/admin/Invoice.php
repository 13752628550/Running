<?php

namespace app\model\admin;

use app\model\common\BaseModel;

/**
 * @mixin think\Model
 */
class Invoice extends BaseModel
{
    // 关联用户
    public function User(){
        return $this->belongsTo(\app\model\common\User::class,'user_id')->field([
            'id','username','avatar'
        ]);
    }
    
    // 关联订单
    public function Order(){
        return $this->belongsTo('Order')->field([
            "id","no","total_price","payment_method","refund_status","closed","ship_status"
        ]);
    }
}
