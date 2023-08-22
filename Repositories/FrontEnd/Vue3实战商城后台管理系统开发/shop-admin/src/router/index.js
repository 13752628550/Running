// 导入路由及页面组件
import { createRouter, createWebHashHistory } from 'vue-router'
import Index from '~/pages/index.vue'
import Login from '~/pages/login.vue'
import NotFound from "~/pages/404.vue"
// 定义路由地址
const routes = [
    {
        path: "/", component: Index
    }, {
        path: "/login", component: Login
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