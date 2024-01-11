import { router, addRoutes } from "~/router"
import { getToken } from "~/composables/auth"
import { toast, showFullLoading, hideFullLoading } from "~/composables/util"
import store from "./store"

// 全局前置守卫
let hasGetInfo = false;
router.beforeEach(async (to, from, next) => {
    // 显示 loading
    showFullLoading()

    const token = getToken()

    /***********************************************
     *  权限不正确，强制返回登录页面
     *  规则：不存在 token数据，而且目标页面不是 /login 
     *  操作：返回 /login 登录页面
     * *********************************************/
    if (!token && to.path != "/login") {
        toast("请先登录", "error")
        return next({ path: "/login" })
    }

    /**************************************************    
     *  防止反复登录 /login 页面
     *  规则： token数据正常存在，而且目标是 /login 页面
     *  操作： 转到 /index 主页面
     * ************************************************/
    if (token && to.path == "/login") {
        toast("请勿重复登录", "error")
        return next({ path: from.path ? from.path : "/" })
    }


    /**************************************************    
    *  登录成功了，自动获取用户信息，存储在vuex当中共享
    *  规则： token 数据正常存在 
    *  操作： 执行 getinfo 把用户信息存储在 vuex 共享当中
    * *************************************************/
    let hasNewRoutes = false
    if (token && !hasGetInfo) {
        let { menus } = await store.dispatch("getinfo");
        hasGetInfo = true;
        // 动态添加路由
        hasNewRoutes = addRoutes(menus);
    }





    // 设置页面标题
    let title = (to.meta.title ? to.meta.title : "") + "-帝莎编程商城后台";
    document.title = title;

    hasNewRoutes ? next(to.fullPath) : next();
});

// 全局后置守卫
router.afterEach((to, from) => {
    // 隐藏 loading
    hideFullLoading()
})