<?php

namespace app\controller\admin;

use think\Request;
use app\controller\common\Base;
use think\facade\Db;
use think\facade\Queue;

class Invoice extends Base
{
    // 开发票
    public function update(){
        ApiException('演示数据，禁止操作');
        $invoice = request()->Model;
        // 判断是否已开过
        if ($invoice->status) {
            ApiException('已经开过发票');
        }

        $invoice->status = 1;
        $result = $invoice->save();
        
        return showSuccess($result);
    }

	// 列表
	public function index(){
		$param = request()->param();
        $limit = intval(getValByKey('limit',$param,10));
        $model = $this->M;
        $totalCount = $model->count();
        $list = $model->page($param['page'],$limit)
		        ->with(['order','user'])
		        ->order([ 'id'=>'desc' ])
				->select()
				->toArray();
		$list = array_map(function($v){
		    $order = $v['order'];
		    $order_status = '已付款';
		    if($order){
		        if(!$order['payment_method']){
		            $order_status = '未付款';
		        } elseif ($order['closed'] == 1) {
		            $order_status = '已关闭';
		        } elseif ($order['refund_status'] == 'applied') {
		            $order_status = '退款中';
		        }
		    }
		    $user = $v['user'];
		    return [
		         "id"=>$v['id'],
			     "order_no"=>$order ? $order['no'] : '订单已被删除',
			     "order_status"=>$order_status,
			     "price"=>$order ? $order['total_price'] : '订单已被删除',
			     "username"=>$user ? $user['username'] : '用户已被删除',
			     "type"=>$v['type'],
			     "name"=>$v['name'],
			     "phone"=>$v['phone'],
			     "email"=>$v['email'],
			     "code"=>$v['code'],
			     "path"=>$v['path'],
			     "bankname"=>$v['bankname'],
			     "bankno"=>$v['bankno'],
			     "create_time"=>$v['create_time'],
			     "status"=>$v['status'],
			     "update_time"=>$v['update_time'],
			 ];
		},$list);
        return showSuccess([
        	'list'=>$list,
        	'totalCount'=>$totalCount
        ]);
	}


	// 批量删除
    public function deleteAll(){
    	ApiException('演示数据，禁止删除');
        return showSuccess($this->M->MdeleteAll());
    }
}
