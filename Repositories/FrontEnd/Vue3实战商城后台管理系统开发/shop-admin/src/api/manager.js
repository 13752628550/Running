// 引入 axios.js 文件
import axios from '~/axios'

/* ******************** 1. 定义登录方法 **********************
    1. 接口URL
        http://ceshi13.dishait.cn/admin/login

    2. 请求方式
        POST
        Content-Type
        application/x-www-form-urlencoded

    3. 请求Body参数
        参数名	    示例值	参数类型	是否必填	参数描述
        username	admin	Text	    是	        用户名
        password	admin	Text	    是	        密码   
************************************************************/
export function login(username, password) {
    return axios.post("/admin/login", {
        username,
        password
    })
}

/* *************** 2. 获取管理员信息和权限菜单 *****************
    1. 接口URL
        http://ceshi13.dishait.cn/admin/getinfo

    2. 请求方式
        POST
        Content-Type
        application/x-www-form-urlencoded

    3. 请求Header参数
        参数名	示例值	        参数类型	是否必填   参数描述
        token	174...cc40	    Text	    是	     用户token
************************************************************/
export function getinfo() {
    return axios.post("/admin/getinfo")
}