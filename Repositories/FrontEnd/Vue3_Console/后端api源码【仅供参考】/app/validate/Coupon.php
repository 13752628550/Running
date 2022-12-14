<?php

namespace app\validate;

class Coupon extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist:true,admin\Coupon',
        'page'=>'require|integer|>:0',
        'status'=>'require|in:0,1',
        'name'=>'require',
        'type'=>'require|in:0,1',
        'value'=>'require|float',
        'total'=>'require|integer|>:0',
        'min_price'=>'require|float|>:0',
        'start_time'=>'require|integer',
        'end_time'=>'require|integer',
        'order'	=>'require|integer|>=:0',
        'price'=>'require|float|>:0',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    protected $scene = [
        'index'=>['page'],
        'save'=>['name','type','value','total','min_price','start_time','end_time','order'],
        'update'=>['id','name','type','value','total','min_price','start_time','end_time','order'],
        'delete'=>['id'],
        'updateStatus'=>['id','status'],
        'getCoupon'=>['id'],
        'userCoupon'=>['page'],
        'getList'=>['page'],
        'couponCount'=>['price'],
    ];


    public function sceneGetCoupon(){
        return $this->only(['id'])->append('id','checkCoupon');
    }

    // 验证优惠券
    protected function checkCoupon($value, $rule, $data='', $field=''){
        // 获取当前优惠券
        $coupon = request()->Model;
        // 验证状态
        if (!$coupon->status) {
            return '当前优惠券不可用';
        }
        // 是否已经领完
        if ($coupon->used >= $coupon->total) {
            return '优惠券已被领完';
        }
        // 是否已经超过有效期
        $time = time();
        
        if (strtotime($coupon->start_time) > $time) {
            return '优惠券还不可以领取';
        }
        
        if (strtotime($coupon->end_time) < $time) {
            return '优惠券已失效';
        }
        return true;
    }
}
