import { createRouter, createWebHistory } from 'vue-router'
const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            component: () => import('../pages/index')
        },
        {
            path: '/about',
            component: () => import('../pages/about'),
            children: [
                {
                    path: 'query',
                    component: () => import('../pages/query'),
                    name: 'query'
                },
                {
                    path: 'params/:id/:val/:str',
                    component: () => import('../pages/params'),
                    name: 'params'
                }
            ]

        },
        {
            path: '/login/:id/:title',
            component: () => import('../pages/login'),
            name: "login"
        },
    ],

})























































export default router