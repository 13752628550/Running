// 引入 axios.js 文件
import axios from '~/axios'
/* ******************** 1. 定义登录方法 **********************
    1. 接口URL
        http://http://172.26.32.179:3000/xppcx

    2. 请求方式
        get
       Content-Type
        application/x-www-form-urlencoded

    3. 请求get参数
        sqlView: 视图名
        RNumber: 图番名 
************************************************************/
export function xppcx(sqlView, RNumber) {
    return axios.get("/xppcx", {
        params: {
            sqlView,
            RNumber,
        }
    })
}



const config = {
    httpsAgent: {
        rejectUnauthorized: false,
    },
};

/* ******************** 1. 定义登录方法 **********************
    1. 接口URL
        http://http://172.26.32.179:3000/login

    2. 请求方式
        get
       Content-Type
        application/x-www-form-urlencoded

    
        3. 请求get参数
        sqlView: 视图名
        RNumber: 图番名 
************************************************************/
export function login() {
    return axios.get('/login', config)
        .then(response => {
            console.log(response.data);
        })
        .catch(error => {
            console.error('Error:', error.message);
        });
}