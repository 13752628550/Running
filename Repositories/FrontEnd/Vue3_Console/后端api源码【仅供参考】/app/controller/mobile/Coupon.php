<?php

namespace app\controller\mobile;

use think\Request;
use app\controller\common\Base;
use app\model\admin\CouponUser;
use think\model\Relation;

class Coupon extends Base
{
    protected $ModelPath = 'admin\Coupon';
    // 领取优惠券
    public function getCoupon(Request $request){
        $user = $request->UserModel;
        $coupon = $request->Model;
        $data = [
            'user_id'=>$user->id,
            'coupon_id'=>$coupon->id
        ];
        $c = $coupon->CouponUser()->where($data)->find();
        // 已经领取过
        if ($c) {
            return ApiException('你已经领取过了');
        }
        // 创建记录
        return showSuccess($coupon->CouponUser()->save($data));
    }

    // 用户优惠券列表
    public function userCoupon(){
        $param = request()->param();
        $user = request()->UserModel;
    	// 未失效
    	$condition = $param['isvalid'] !== 'invalid';
    	// 查询
    	$list = CouponUser::hasWhere('coupon', function($query) use($condition){
    		$query->when($condition,function($query){
    			// 未失效
    			$query->whereBetweenTimeField('start_time', 'end_time')
				->where('status',1);
    		},function($query){
    			// 已失效
    			$query->whereOr('start_time', '>', time())
	    		->whereOr('end_time','<', time())
				->where('status',1);
    		});
		})
		->with(['coupon'])
		->where('user_id',$user->id)
		->page($param['page'],10)
		->order('create_time','desc')
		->select();
        return showSuccess($list);
    }
    
    // 优惠券列表
    public function getList(){
        $param = request()->param();
        $where = [];
        if (request()->UserModel) {
            $where['user_id'] = request()->UserModel->id;
        }
        $list = $this->M->where([
            'status'=>1,
        ])
        ->with([
            'CouponUser'=>function($query) use($where){
                $query->where($where);
            }
        ])
        ->order('create_time','desc')
        ->page($param['page'],10)
        ->select();
        return showSuccess($list);
    }
    
    // 当前订单可用优惠券数量
    public function couponCount(){
    	$param = request()->param();
    	$user = request()->UserModel;
    	// 查询
    	$count = CouponUser::hasWhere('coupon', function($query) use($param){
    		$query->whereBetweenTimeField('start_time', 'end_time')
				->where('status',1)
				->where('min_price','<=',$param['price']);
		})
		->with(['coupon'])
		->where('CouponUser.used',0)
		->where('user_id',$user->id)
		->count();
		return showSuccess($count);
    }

}
