import { createStore } from 'vuex'
import { login, getinfo } from '~/api/manager'          // 导入登录请求 axios
import { setToken, removeToken } from '~/composables/auth'           // Token 存储函数引入   

// 创建一个实例
const store = createStore({
    state() {
        return {
            // 用户信息保存
            user: {}
        }
    },
    mutations: {
        /*******************************************************
         *  SET_USERINFO(state, user){}
         *  作用：记录用户信息 
         *  操作：将api请求用户信息存入state.user   
         * ****************************************************/
        SET_USERINFO(state, user) {
            state.user = user
        }
    },
    actions: {
        /*******************************************************    
        *  login(){} 
        *  作用：进行登录验证，将token信息存入本地 Cookie 
        *  操作：执行 api 请求中 login() 函数验证用户信息 
        *        执行 setToken 工具将token存储本地 Cookie
        *  注意：错误验证信息通过 .catch 发送
        * ******************************************************/
        login({ commit }, { username, password }) {
            return new Promise((resolve, reject) => {
                login(username, password).then((res) => {
                    setToken(res.token)
                    resolve(res)
                }).catch(err => reject(err))
            })
        },

        /*******************************************************    
        *  getinfo(){} 
        *  作用：获取当前登录用户信息，将信息存入 state.user 
        *  操作：执行 api 请求中 getinfo() 函数取用户信息 
        *        执行 mutations中 SET_USERINFO 把用户信息存储
        *  注意：通过解构赋值 {commit} = store.commit
        * ******************************************************/
        getinfo({ commit }) {
            return new Promise((resolve, reject) => {
                getinfo().then((res) => {
                    commit("SET_USERINFO", res)
                    resolve(res)
                }).catch(err => reject(err))
            })
        },

        /*******************************************************    
        *  logout(){} 
        *  作用：退出登录用户 
        *  操作：执行 util 中 removeToken() 函数清除用户信息 
        *        执行 mutations 中 SET_USERINFO 把用户信息清空
        *  注意：通过解构赋值 {commit} = store.commit
        * ******************************************************/
        logout({ commit }) {
            // 移除cookie 里面 token
            removeToken()
            // 清除当前用户状态
            commit("SET_USERINFO", {})
        }
    },


})
export default store