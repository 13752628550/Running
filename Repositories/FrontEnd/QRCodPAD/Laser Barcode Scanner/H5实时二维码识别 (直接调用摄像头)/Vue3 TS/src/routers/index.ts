import { createRouter, createWebHashHistory } from 'vue-router'
import type { RouteRecordRaw } from 'vue-router'

import Index from '@/views/index/index.vue'
import One from '@/views/one/one.vue'
import Sastain from '@/views/sastain/sastain.vue'
import Higin from '@/views/higin/higin.vue'

const routes: RouteRecordRaw[] = [
  {
    path: '/',
    redirect: '/index'
  },
  {
    path: '/index',
    name: 'index',
    component: Index
  },
  {
    path: '/one',
    name: 'one',
    component: One
  },
  {
    path: '/sastain',
    name: 'sastain',
    component: Sastain
  },
  {
    path: '/higin',
    name: 'higin',
    component: Higin
  }
]

const router = createRouter({
  routes,
  history: createWebHashHistory()
})

export default router
