import axios from "axios"
// 创建 axios 实例
const service = axios.create({

    baseURL: "/api"      // 域名通用部分 http://ceshi13.dishait.cn/ ，此路径在配置文件 vite.config.js 中定义

})
// 实例进行默认导出
export default service