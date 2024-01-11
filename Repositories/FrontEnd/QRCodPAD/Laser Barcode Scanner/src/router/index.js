//引入组件
import {
    createRouter,
    createWebHashHistory
} from 'vue-router'
import xppMainFrm from '~/pages/xppMainFrm.vue'
import mainForm from "~/pages/mainForm.vue"
import about from "~/pages/about.vue"
import NotFound from "~/pages/404.vue"
//定义路由
const routes = [
    {
        path: "/",
        name: "xppMainFrm",
        component: xppMainFrm,
    }, {
        path: "/xpp",
        name: "xpp",
        component: xppMainFrm,
    }, {
        path: "/about",
        name: "about",
        component: about,
    }, {
        path: '/:pathMatch(.*)*',
        name: "NotFound",
        component: NotFound,
    },
]
//创建路由实例
const router = createRouter({
    history: createWebHashHistory(),
    routes: routes
})
export default router