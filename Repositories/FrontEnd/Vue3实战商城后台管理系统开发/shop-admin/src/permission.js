import router from "~/router"
import { getToken } from "~/composables/auth"
import { toast } from "~/composables/util"

// 全局前置守卫
router.beforeEach((to, from, next) => {
    const token = getToken()

    // 权限不通过，强制返回主页
    if (!token && to.path != "/login") {
        toast("请先登录", "error")
        return next({ path: "/login" })
    }

    // 权限通过正常放行

    if (token && to.path == "/login") {
        toast("请勿重复登录", "error")
        return next({ path: from.path ? from.path : "/" })  //防止反复登录
    }
    next()
})
