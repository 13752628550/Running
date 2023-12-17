import axios from "axios"
// 创建 axios 实例
const service = axios.create({
    baseURL: "https://172.26.32.179:3000"      // 域名通用部分/
})
// 实例进行默认导出
export default service