<?php


use think\facade\Route;

// 不需要验证
Route::group('admin',function(){
    // 管理员登录
    Route::post('login','admin.Manager/login')->name('login');
})->allowCrossDomain();
// 验证登录
Route::group('admin',function(){
	 // 退出登录
    Route::post('logout','admin.Manager/logout')->name('logout');
    // 获取管理员登录信息
    Route::post('getinfo','admin.Manager/getinfo')->name('getManagerInfo');
    
    // 修改密码
    Route::post('updatepassword','admin.Manager/updatepassword');
})->allowCrossDomain([
    "Access-Control-Allow-Headers"=>"token"
])->middleware(\app\middleware\hasManagerLogin::class);
// 需要验证权限
Route::group('admin',function(){
    
    // 统计相关
    Route::get('statistics1','admin.Index/statistics1')->name("getStatistics1");
    Route::get('statistics2','admin.Index/statistics2')->name("getStatistics2");
    Route::get('statistics3','admin.Index/statistics3')->name("getStatistics3");
    
    /**
     * 管理员相关
     */
    // 当前管理员
    Route::post('manager/:id/delete','admin.Manager/delete')->name('deleteManager');
    Route::get('manager/:page','admin.Manager/index')->name('getManagerList');
    Route::post('manager','admin.Manager/save')->name('createManager');
    Route::post('manager/:id','admin.Manager/update')->name('updateManager');
    Route::post('manager/:id/update_status','admin.Manager/updateStatus')->name('updateManagerStatus');

    // 规则
    Route::get('rule/:page','admin.Rule/index')->name('getRuleList');
    Route::post('rule/:id/delete','admin.Rule/delete')->name('deleteRule');
    Route::post('rule','admin.Rule/save')->name('createRule');
    Route::post('rule/:id','admin.Rule/update')->name('updateRule');
    Route::post('rule/:id/update_status','admin.Rule/updateStatus')->name('updateRuleStatus');

    // 角色
    Route::post('role/:id/delete','admin.Role/delete')->name('deleteRole'); 
    Route::get('role/:page','admin.Role/index')->name('getRoleList');
    Route::post('role','admin.Role/save')->name('createRole'); 
    Route::post('role/set_rules','admin.Role/setRules')->name('setRoleRules'); 
    Route::post('role/:id','admin.Role/update')->name('updateRole');
    Route::post('role/:id/update_status','admin.Role/updateStatus')->name('updateRoleStatus');

    // 相册管理
    Route::get('image_class/:id/image/:page$','admin.ImageClass/images')->name('getCurrentImageList');
    Route::get('image_class/:page','admin.ImageClass/index')->name('getImageClassList');
    Route::post('image_class','admin.ImageClass/save')->name('createImageClass');
    Route::post('image_class/:id/delete','admin.ImageClass/delete')->name('deleteImageClass');
    Route::post('image_class/:id','admin.ImageClass/update')->name('updateImageClass');
    

    // 附件管理
    Route::get('image/:page','admin.Image/index')->name('getImageList');
    Route::post('image/upload','admin.Image/save')->name('uploadImage');
    Route::post('image/delete_all$','admin.Image/deleteAll')->name('deleteImage');
    Route::post('image/:id','admin.Image/update')->name('updateImage');

    // 商品分类
    Route::get('category','admin.Category/index')->name('getCategoryList');
    Route::post('category','admin.Category/save')->name('createCategory');
    Route::post('category/sort','admin.Category/sortCategory')->name('sortCategory');
    Route::post('category/:id/update_status','admin.Category/updateStatus')->name('updateCategoryStatus');
    Route::post('category/:id/delete','admin.Category/delete')->name('deleteCategory');
    Route::post('category/:id','admin.Category/update')->name('updateCategory');
   

    // 商品规格
    Route::get('skus/:page','admin.Skus/index')->name('getSkusList');
    Route::post('skus','admin.Skus/save')->name('createSkus');
    Route::post('skus/delete_all','admin.Skus/deleteAll')->name('deleteSkus');
    Route::post('skus/:id','admin.Skus/update')->name('updateSkus');
    Route::post('skus/:id/update_status','admin.Skus/updateStatus')->name('updateSkusStatus');


	// 商品评论
	Route::get('goods_comment/:page','admin.OrderItem/index')->name('getCommentList');
	Route::post('goods_comment/review/:id','admin.OrderItem/review')->name('reviewComment');
	Route::post('goods_comment/:id/update_status','admin.OrderItem/updateStatus')->name('updateCommentStatus');
	
	 // 会员
    Route::get('user/:page','admin.User/index')->name('getUserList');
    Route::post('user','admin.User/save')->name('createUser');
    Route::post('user/:id/update_status','admin.User/updateStatus')->name('updateUserStatus');
    Route::post('user/:id/delete','admin.User/delete')->name('deleteUser');
    Route::post('user/:id','admin.User/update')->name('updateUser');

    // 会员等级
    Route::get('user_level/:page','admin.UserLevel/index')->name('getUserLevelList');
    Route::post('user_level','admin.UserLevel/save')->name('createUserLevel');
    Route::post('user_level/:id/update_status','admin.UserLevel/updateStatus')->name('updateUserLevelStatus');
    Route::post('user_level/:id/delete','admin.UserLevel/delete')->name('deleteUserLevel');
    Route::post('user_level/:id','admin.UserLevel/update')->name('updateUserLevel');
   
	
	// 公告
    Route::get('notice/:page','admin.Notice/index')->name('getNoticeList');
    Route::post('notice','admin.Notice/save')->name('createNotice');
    Route::post('notice/:id/delete','admin.Notice/delete')->name('deleteNotice');
    Route::post('notice/:id','admin.Notice/update')->name('updateNotice');
    
    // 优惠券
    Route::get('coupon/:page','admin.Coupon/index')->name('getCouponList');
    Route::post('coupon','admin.Coupon/save')->name('createCoupon');
    Route::post('coupon/:id/delete','admin.Coupon/delete')->name('deleteCoupon');
    Route::post('coupon/:id/update_status','admin.Coupon/updateStatus')->name('updateCouponStatus');
    Route::post('coupon/:id','admin.Coupon/update')->name('updateCoupon');
	
	
	// 配置信息
	Route::get('sysconfig','admin.SysSetting/get')->name('getSysSetting');
	Route::post('sysconfig','admin.SysSetting/set')->name('setSysSetting');
	
	
	Route::get('express_company/:page','admin.ExpressCompany/index')->name("getExpressCompanyList");
	// 批量删除订单
	Route::post('order/delete_all','admin.Order/deleteAll')->name("deleteOrder");
	// 订单
	Route::get('order/:page','admin.Order/orderList')->name('getOrderList');
	// 订单发货
    Route::post('order/:id/ship','admin.Order/ship')->name('shipOrder');
    // 拒绝/同意
    Route::post('order/:id/handle_refund','admin.Order/handleRefund')->name('refundOrder');
    // 导出订单
    Route::post('order/excelexport','admin.Order/excelexport')->name('exportOrder');
    // 查看物流信息
    Route::get('order/:id/get_ship_info','admin.Order/getShipInfo')->name("getShipInfo");
	
	// 上传文件
	Route::post('sysconfig/upload','admin.SysSetting/upload')->name('sysconfigUpload');
	
	
    // 商品
    Route::get('goods/read/:id','admin.Goods/adminread')->name("readGoods");
    Route::post('goods/updateskus/:id','admin.Goods/updateSkus')->name("updateGoodsSkus");
    Route::post('goods/banners/:id','admin.Goods/updateBanners')->name("setGoodsBanner");
    Route::get('goods/:page','admin.Goods/index')->name("getGoodsList");
    Route::post('goods/restore','admin.Goods/restore')->name("restoreGoods");
    Route::post('goods/destroy','admin.Goods/destroy')->name("destroyGoods");
    Route::post('goods/delete_all','admin.Goods/deleteAll')->name("deleteGoods");
    Route::post('goods/changestatus','admin.Goods/changeStatus')->name("updateGoodsStatus");
    Route::post('goods','admin.Goods/save')->name("createGoods");
    Route::post('goods/:id','admin.Goods/update')->name("updateGoods");
    Route::post('goods/:id/check','admin.Goods/checkGoods')->name("checkGoods");


    // 商品对应规格卡片
    Route::post('goods_skus_card','admin.GoodsSkusCard/save')->name("createGoodsSkusCard");
    Route::post('goods_skus_card/sort','admin.GoodsSkusCard/sort')->name("sortGoodsSkusCard");
    Route::post('goods_skus_card/:id/set','admin.GoodsSkusCard/set')->name("chooseAndSetGoodsSkusCard");
    Route::post('goods_skus_card/:id/delete','admin.GoodsSkusCard/delete')->name("deleteGoodsSkusCard");
    Route::post('goods_skus_card/:id','admin.GoodsSkusCard/update')->name("updateGoodsSkusCard");
    
    
    // 商品对应规格卡片的值
    Route::post('goods_skus_card_value','admin.GoodsSkusCardValue/save')->name("createGoodsSkusCardValue");
    Route::post('goods_skus_card_value/:id','admin.GoodsSkusCardValue/update')->name("updateGoodsSkusCardValue");
    Route::post('goods_skus_card_value/:id/delete','admin.GoodsSkusCardValue/delete')->name("deleteGoodsSkusCardValue");
    

    // 分类关联推荐
    Route::get('app_category_item/list','admin.AppCategoryItem/index')->name("getCategoryGoods");
    Route::post('app_category_item','admin.AppCategoryItem/save')->name("connectCategoryGoods");
    Route::post('app_category_item/:id/delete','admin.AppCategoryItem/delete')->name("deleteCategoryGoods");
    

    
    // app分类数据
    // Route::get('app_index_category/list','admin.AppIndexCategory/index');
    // Route::get('app_index_data/list','admin.AppIndexData/index');
    // Route::post('app_index_data','admin.AppIndexData/save');
    // Route::post('app_index_data/sort','admin.AppIndexData/sortData');
    // Route::post('app_index_data/:id','admin.AppIndexData/update');
    // Route::post('app_index_data/:id/delete','admin.AppIndexData/delete');
    
     // 分销模块
    Route::get('agent/statistics','admin.Agent/statistics')->name("getAgentStatistics");
    Route::get('agent/:page','admin.Agent/index')->name('getAgentList');
    // 推广订单
    Route::get('user_bill/:page','admin.UserBill/index')->name('getUserBillList');
    Route::get('distribution_setting/get','admin.DistributionSetting/get')->name('getDistributionSetting');
	Route::post('distribution_setting/set','admin.DistributionSetting/set')->name('setDistributionSetting');

    
})->allowCrossDomain([
    "Access-Control-Allow-Headers"=>"token"
])->middleware(\app\middleware\checkManagerToken::class);





