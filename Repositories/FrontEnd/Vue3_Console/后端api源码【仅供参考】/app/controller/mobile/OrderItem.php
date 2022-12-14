<?php

namespace app\controller\mobile;

use think\Request;
use app\controller\common\Base;
use think\facade\Db;
class OrderItem extends Base
{
    protected $ModelPath = 'admin\OrderItem';
    // 商品评价
    public function sendReview(){
        // 获取当前订单商品
        $orderItem = request()->Model;
        $order = $orderItem->order;
        // 是否是用户本人
        $user = request()->UserModel;
        if ($order->user_id !== $user->id) {
           ApiException('非法操作');
        }
        // 判断是否已经评价过了
        if ($orderItem->getData('review_time')) {
            ApiException('该订单已评价过了');
        }
        // 开启事务
        $result = Db::transaction(function () use($order,$orderItem){
            $param  = request()->param();
            // 更新orderItem
            $orderItem->rating = getValByKey('rating',$param,1);
            $orderItem->review =  getValByKey('review',$param,null);
            $orderItem->review_time = time();
            $orderItem->save();

            // 判断order下所有订单是否都已评价
            $reviewed = true;
            $res = $this->M->where([
                'order_id'=>$order->id,
                'review_time'=>null
            ])->find();
            if (!$res) {
                $order->reviewed = 1;
                $order->save();
            }
            return true;
        });
        return showSuccess($result);
    }
    
}
