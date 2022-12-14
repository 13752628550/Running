import { createRouter, createWebHistory } from 'vue-router'
const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            component: () => import('../pages/index'),
            meta: { title: '主页' },
            beforeEnter: (to, from, next) => {
                console.log('beforeEnter');
                next()
            }
        },
        {
            path: '/about',
            component: () => import('../pages/about'),
            children: [
                {
                    path: 'query',                  // query 通讯方式
                    component: () => import('../pages/query'),
                    name: 'query',
                    meta: { title: 'query通讯' }
                },

                {
                    path: 'params/:id/:val/:str',   // params 通讯方式
                    component: () => import('../pages/params'),
                    name: 'params',
                    meta: { title: 'params通讯' }
                }
            ],
            meta: { title: '关于' }
        },
        {
            path: '/login',
            component: () => import('../pages/login'),
            name: "login",
            children: [
                {
                    path: 'props1',
                    component: () => import('../pages/props1'),

                    name: 'props1',
                    meta: { title: 'props 对象' },
                    props: { a: 900 }       // props 对象方式
                },
                {
                    path: 'props2/:id/:val/:str',
                    component: () => import('../pages/props2'),
                    name: 'props2',
                    meta: { title: 'props 布尔' },
                    props: true             // props 布尔方式
                },
                {
                    path: 'props3/:id/:val/:str',
                    component: () => import('../pages/props3'),
                    name: 'props3',
                    meta: { title: 'props函数' },
                    props: ($route) => { return { a: 900, id: $route.params.id } }             // props 函数方式
                }
            ],
            meta: { title: '登录' }
        },
    ],
})

router.beforeEach((to, from, next) => {                         // 全局前置路由守卫
    if (to.meta.isAuth) {
    } else {
        next()
    }
})
router.afterEach((to, from) => {                               // 全局后置路由守卫
    document.title = to.meta.title;
})













export default router