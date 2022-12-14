<?php

namespace app\validate;

class Order extends BaseValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id'=>'require|integer|>:0|isExist:true,admin\Order',
        'user_addresses_id'=>'require|integer|>:0|checkAddress',
        'items|订单商品'=>'require|checkShopId',
        'express_company|物流公司'=>'require',
        'express_no|物流单号'=>'require',
        'reason|退款理由'=>'require',
        'agree'=>'require|in:0,1',
        'disagree_reason|拒绝退款理由'=>'requireIf:agree,0',
        'coupon_user_id'=>'integer|>=:0|checkCoupon',
        'type|订单类型'=>'require|in:paying,receiving,reviewing,all',
        'page'=>'require|integer|>:0',
        'limit'=>"integer",
        'ids'=>'require|array',
        'invoice'=>'array|checkInvoice'
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [];

    // 场景
    protected $scene = [
        'index'=>['type'],
        'save'=>['user_addresses_id','items','coupon_user_id','invoice'],
        'read'=>['id'],
        'ship'=>['id','express_company','express_no'],
        'received'=>['id'],
        'getShipInfo'=>['id'],
        'applyRefund'=>['id','reason'],
        'handleRefund'=>['id','agree','disagree_reason'],
        'closeOrder'=>['id'],
        'getShipInfo'=>['id'],
        
        'orderList'=>['page','limit'],
        'deleteAll'=>['ids']
    ];
    
    // 验证发票信息
    public function checkInvoice($value, $rule, $data='', $field=''){
        if(!$value){
            return true;
        }
        
        $field = [
            "name"     =>  "string",
            "phone"    =>  "string",
            "email"    =>  "string",
            "code"    =>  "string",
            "path"     =>  "string",
            "bankname"    =>  "string",
            "bankno"    =>  "string",
            "type"      =>  "integer",
        ];
        $newValue = [];
        foreach ($field as $key => $rule) {
            // 验证不存在
            if (!array_key_exists($key,$value)) {
                ApiException("发票信息中的 ".$key." 字段缺失");
            }
            // 验证类型
            if (gettype($value[$key]) != $rule) {
                ApiException("发票信息中的 ".$key." 格式不是 ".$rule."类型");
            }
            $newValue[$key] = $value[$key];
        }
        return true;
    }

    // 验证商品
    protected function checkShopId($value, $rule, $data='', $field=''){
        // 字符串转数组
        $value = explode(',',$value);
        $value = \app\model\admin\Cart::where('id','in',$value)->select()->toArray();
        // 验证数量
        if (count($value) === 0) {
            return '请选择要下单的商品';
        }
        request()->items = $value;
        // $keys = ['id','shop_id','num','skus_type'];
        foreach ($value as $v) {
            // 验证商品
            $this->checkGoodsSkus($v['shop_id'],$v['skus_type'],$v['num']);
        }
        return true;
    }


    // 验证地址是否合法
    public function checkAddress($value, $rule, $data='', $field=''){
        $userId = request()->UserModel->id;
        $address = \app\model\common\UserAddresses::where([
            'user_id'=>$userId,
            'id'=>$value
        ])->find();
        if (!$address) {
            return '收货地址不存在';
        }
        request()->UserAddresses = $address;
        return true;
    }

    // 验证优惠券
    protected function checkCoupon($value, $rule, $data='', $field=''){
        if ($value === 0) {
            return true;
        }
        // 获取当前优惠券
        $userId = request()->UserModel->id;
        $CouponUser = \app\model\admin\CouponUser::where('user_id',$userId)->find($value);

        if (!$CouponUser) {
            return '优惠券不存在';
        }

        // 已经使用过了
        if ($CouponUser->used) {
            return '当前优惠券已经使用过了';
        }

        $coupon = $CouponUser->coupon;
        // 已失效
        $time = time();
        if (strtotime($coupon->start_time) > $time) {
            return '优惠券未生效';
        }
        if (strtotime($coupon->end_time) < $time) {
            return '优惠券已失效';
        }

        // 挂载
        request()->couponUser = $CouponUser;
        request()->coupon = $coupon;
        return true;
    }
}
