import axios from "axios"
import { toast } from '~/composables/util'
import { getToken } from '~/composables/auth'
import store from "./store"
// 1. 创建 axios 实例
const service = axios.create({
    baseURL: "/api"         // 域名通用部分 http://ceshi13.dishait.cn/ ，此路径在配置文件 vite.config.js 中定义
})

// 2. 添加请求拦截器
service.interceptors.request.use(function (config) {
    // 在请求 header 头自动添加token 
    const token = getToken()
    if (token) {
        config.headers["token"] = token
    }

    return config;
}, function (error) {
    // 对请求错误做些什么
    return Promise.reject(error);
});


// 3. 添加响应拦截器
service.interceptors.response.use(function (response) {
    // 对响应数据做设置
    return response.data.data;       // 返回响应数据 response.data.data
}, function (error) {
    // 对响应不正确通知
    const msg = error.response.data.msg || "请求失败"
    if (msg == "非法token，请先登录！") {
        store.dispatch("logout").finally(() => location.reload())
    }
    toast(msg, "error")

    return Promise.reject(error);
});

// 实例进行默认导出
export default service