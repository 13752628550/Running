<?php

namespace app\job;

use think\queue\Job;
use think\facade\Db;
class CloseOrder{

    public function fire(Job $job, $data){
        //通过这个方法可以检查这个任务已经重试了几次了
        if ($job->attempts() > 3) {
            trace('[自动关闭订单] 任务超过三次失败', 'error');
            $job->delete();
        }
        // 拿到当前订单
        $orderId = $data['orderId'];
        $order = \app\model\admin\Order::find($orderId);
        trace('[自动关闭订单] 获取订单', 'info');
        // 判断对应的订单是否已经被支付
        // 如果已经支付则不需要关闭订单，直接退出
        if ($order->paid_time) {
            trace('[自动关闭订单] 订单已付款', 'info');
            return $job->delete();
        }
        // 通过事务执行 sql
        $result = Db::transaction(function() use($order){
            // 将订单的 closed 字段标记为 1，即关闭订单
            $order->closed = 1;
            $order->save();
            trace('[自动关闭订单] 设置订单为关闭状态', 'info');
            // 循环遍历订单中的商品 SKU，将订单中的数量加回到 SKU 的库存中去
            $order->orderItems->each(function($v) use($order){
                // 判断单规格还是多规格
                $skuModel = $v->skus_type === 0 ?'\app\model\admin\Goods':'\app\model\admin\GoodsSkus';
                // 根据订单获取当前商品
                $sku = $skuModel::find($v->shop_id);
                if ($sku) {
                    trace('[自动关闭订单] 开始还原库存', 'info');
                    $order->addStock($v->num,$sku);
                    trace('[自动关闭订单] 还原库存成功', 'info');
                } else {
                    $skuType = $v->skus_type === 0 ?'单规格':'多规格';
                    trace('[自动关闭订单] 找不到'.$skuType.'商品id'.$v->shop_id, 'error');
                }
            });
            // 恢复优惠券使用情况
            if ($order->coupon_user_id) {
               $CouponUser = \app\model\admin\CouponUser::find($order->coupon_user_id);
               $CouponUser->changeUsed(0);
            }
            return true;
        });

        if ($result) {
            // 如果任务执行成功，删除任务
            trace('[自动关闭订单] 任务成功，结束', 'info');
            $job->delete();
        } else {
            // 重新发布任务
            trace('[自动关闭订单] 任务失败，重试', 'error');
            $job->release();
        }
    }

    public function failed($data){
        // ...任务达到最大重试次数后，失败了
    }
}