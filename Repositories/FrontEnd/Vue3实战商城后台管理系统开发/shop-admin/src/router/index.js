// 导入路由及页面组件
import { createRouter, createWebHashHistory } from 'vue-router'
import Admin from "~/layouts/admin.vue"
import Index from '~/pages/index.vue'
import Login from '~/pages/login.vue'
import NotFound from "~/pages/404.vue"
import GoodList from "~/pages/goods/list.vue"
import CategoryList from "~/pages/category/list.vue"

// 默认路由，所有用户共享
const routes = [{
    path: "/",
    name: "admin",
    component: Admin,
}, {
    path: "/login",
    component: Login,
    meta: { title: "登录页" }
}, {
    path: '/:pathMatch(.*)*',
    name: 'NotFound',
    component: NotFound
}]

// 动态路由，用于匹配菜单动态添加路由
const asyncRoutes = [{
    path: "/",
    name: "/",
    component: Index,
    meta: { title: "后台首页" }
}, {
    path: "/goods/list",
    name: "/goods/list",
    component: GoodList,
    meta: { title: "商品管理" }
}, {
    path: "/category/list",
    name: "/category/list",
    component: CategoryList,
    meta: { title: "分类列表" }
}]


// 创建路由器实例
export const router = createRouter({
    history: createWebHashHistory(),
    routes: routes
})

// 动态添加路由的方法    addRoutes(menu) -> findAndAddRoutesByMenus(arr)
export function addRoutes(menus) {
    // 是否有新的路由
    let hasNewRoutes = false

    // 递归遍历路由方法
    const findAndAddRoutesByMenus = (arr) => {
        arr.forEach(e => {
            let item = asyncRoutes.find(o => o.path == e.frontpath)
            if (item && router.hasRoute(item.path)) {
                router.addRoute("admin", item)
                hasNewRoutes = true
            }
            if (e.child && e.child.length > 0) {
                findAndAddRoutesByMenus(e.child)
            }
        })
    }

    findAndAddRoutesByMenus(menus)

    return hasNewRoutes

}