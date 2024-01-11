import axios from '~/axios'
// 后台首页统计1
export function getStatistics1() {
    return axios.get("/admin/statistics1")
}
// 后台首页统计2 
export function getStatistics2() {
    return axios.get("/admin/statistics2")
}
// 后台首页统计3  type: month近1个月、week近1周、hour近1天
export function getStatistics3(type) {
    return axios.get("/admin/statistics3?type=" + type)
}



