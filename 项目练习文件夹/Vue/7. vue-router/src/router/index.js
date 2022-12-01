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
                },
                {
                    path: 'message',
                    component: () => import('../pages/message'),
                }
            ]
        },
        {

            path: '/login',
            component: () => import('../pages/login')
        },
    ],

})


























































export default router