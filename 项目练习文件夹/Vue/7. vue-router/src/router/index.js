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
                    path: 'news',
                    component: () => import('../pages/news'),
                    name: 'news'
                },
                {
                    path: 'message',
                    component: () => import('../pages/message'),
                    name: 'message'
                }
            ]

        },
        {
            path: '/login',
            component: () => import('../pages/login'),
            name: "login"
        },
    ],

})























































export default router