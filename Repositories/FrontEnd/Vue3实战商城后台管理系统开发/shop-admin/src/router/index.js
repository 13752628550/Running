// 导入路由及页面组件
import {
    createRouter,
    createWebHashHistory
} from 'vue-router'
import Admin from "~/layouts/admin.vue"
import Index from '~/pages/index.vue'
import Login from '~/pages/login.vue'
import NotFound from "~/pages/404.vue"
// 定义路由地址
const routes = [
    {
        path: "/",
        component: Admin,
        // 子路由
        children: [{
            path: "/",
            component: Index,
            meta: { title: "后台首页" }
        }]

    }, {
        path: "/login", component: Login, meta: { title: "登录页" }
    }, {
        path: '/:pathMatch(.*)*', name: 'NotFound', component: NotFound
    }
]
// 创建路由器实例
const router = createRouter({
    history: createWebHashHistory(),
    routes: routes
})
// 将实例进行默认导出
export default router