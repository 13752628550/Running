<?php

use think\facade\Route;

// 无需验证
Route::group('api',function(){
    // Route::get('test','admin.Test/test');
    // 会员登录退出
    Route::post('login','mobile.User/login');
    Route::post('reg','mobile.User/reg');

    // app首页分类和数据
    Route::get('index_category/data','mobile.AppIndexCategory/index');
    Route::get('index_category/:id/data/:page','mobile.AppIndexCategory/read');

	// 搜索商品
    Route::post('goods/search','mobile.Goods/search');

	// 热门推荐
    Route::get('goods/hotlist','mobile.Goods/hotList');
	
    // 查看商品
    Route::get('goods/:id','mobile.Goods/read');
    
    // 商品评论
    Route::get('goods/:id/comments/[:comment_type]','mobile.Goods/comments');

	// 商品分类
    Route::get('category/app_category','mobile.Category/app_category');

    // 公告
    Route::get('notice/:page','mobile.Notice/index');
});

// 只有会员能操作
Route::group('api',function(){
    // 退出登录
    Route::post('logout','mobile.User/logout');

    // 会员收货地址
    Route::get('useraddresses/:page','mobile.UserAddresses/index');
    Route::post('useraddresses','mobile.UserAddresses/save');
    Route::post('useraddresses/:id','mobile.UserAddresses/update');
    Route::delete('useraddresses/:id','mobile.UserAddresses/delete');
	
    // 购物车
    Route::post('cart','mobile.Cart/save');
    Route::get('cart','mobile.Cart/index');
    Route::post('cart/delete','mobile.Cart/delete');
    Route::post('cart/updatenumber/:id','mobile.Cart/updateNumber');
    Route::get('cart/:id/sku','mobile.Cart/read');
    Route::post('cart/:id','mobile.Cart/update');

    // 订单
    Route::post('order','mobile.Order/save');
    Route::post('order/:type','mobile.Order/index');
    Route::get('order/:id','mobile.Order/read');
    Route::post('closeorder/:id','mobile.Order/closeOrder');
    // 订单收货
    Route::post('order/:id/received','mobile.Order/received');

    // 商品评价
    Route::post('order_item/:id/review','mobile.OrderItem/sendReview');

    // 查看物流信息
    Route::get('order/:id/get_ship_info','mobile.Order/getShipInfo');

    // 申请退款
    Route::post('order/:id/apply_refund','mobile.Order/applyRefund');

    // 领取优惠券
    Route::post('getcoupon/:id','mobile.Coupon/getCoupon');
    // 用户优惠券列表(是否失效)
    Route::get('usercoupon/:page/:isvalid','mobile.Coupon/userCoupon');
    // 优惠券列表分页
    Route::get('coupon/:page','mobile.Coupon/getList');
    // 当前订单可用优惠券数量
    Route::post('coupon_count','mobile.Coupon/couponCount');
    
    // 微信支付
	Route::get('payment/:id/wxpay','common.Payment/payByWechat');
    
    // 支付宝支付
	Route::get('payment/:id/alipay','common.Payment/payByAlipay');
	
	// 微信小程序支付
	Route::get('payment/:id/wxmppay/:code','common.Payment/payByWechatMp');
    
})->middleware(\app\middleware\checkUserToken::class);

// Route::get('wxpay/:id','common.Payment/payByWechat');

// 支付宝回调
Route::post('api/payment/alipay/notify', 'common.Payment/alipayNotify')->name('alipayNotify');
// 微信回调
Route::post('api/payment/wxpay/notify', 'common.Payment/wechatNotify')->name('wechatNotify');




