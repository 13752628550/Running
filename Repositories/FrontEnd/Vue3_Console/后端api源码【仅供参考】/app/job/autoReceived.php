<?php

namespace app\job;

use think\queue\Job;
use think\facade\Db;
class autoReceived{

    public function fire(Job $job, $data){
        //通过这个方法可以检查这个任务已经重试了几次了
        if ($job->attempts() > 3) {
            trace('[自动确认收货] 任务超过三次失败', 'error');
            $job->delete();
        }
        // 拿到当前订单
        $orderId = $data['orderId'];
        $order = \app\model\admin\Order::find($orderId);
        trace('[自动确认收货] 获取订单', 'info');
        // 如果已经确认收货，直接退出
        if ($order->ship_status == 'received') {
            trace('[自动确认收货] 用户已确认收货', 'info');
            return $job->delete();
        }
        // 确认收货
        $order->ship_status = 'received';
        $result = $order->save();

        if ($result) {
            // 如果任务执行成功，删除任务
            trace('[自动确认收货] 任务成功，结束', 'info');
            $job->delete();
        } else {
            // 重新发布任务
            trace('[自动确认收货] 任务失败，重试', 'error');
            $job->release();
        }
    }

    public function failed($data){
        // ...任务达到最大重试次数后，失败了
    }
}