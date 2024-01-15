## 配置项目

### 1. vite

```shell
#1. 新建 vite 工程及安装 VSCode 插件 
 > npm init vite@latest shop-admin -- --template vue 
 > npm install
 > npm run dev

#2. VSCode 程序插件安装
 > volar
 > Vue 3 Snippets
```

### 2. ElementPlus

```shell
#1. 安装
 > npm install element-plus --save

#2. 引入 (main.js)
 import ElementPlus from 'element-plus'      `//引入组件` 
 import 'element-plus/dist/index.css'        `//引入组件` 
 createApp(App).use(ElementPlus).mount('#app')   `//应用组件` 
```

### 3. windi css

```shell
#1. 安装
 > npm i -D vite-plugin-windicss windicss

#2. 引入 (vite.config.js)
 import WindiCSS from 'vite-plugin-windicss'  `//引入组件`
 export default defineConfig({
 	plugins: [vue(), WindiCSS(),],			 `//引入组件`
 })

#3. 引入 (main.js) 
 import 'virtual:windi.css'					   `//引入组件`
 createApp(App).use(ElementPlus).mount('#app')

#4. 插件安装
 > windicss
```

### 4. vue-router4

```shell
#1. 安装
 > npm install vue-router@4

#2. 创建文件夹及文件
 > src\router                               `//建立新文件夹`
 > src\router\index.js                      `//建立新文件`
 
#3. 定义路由 (router\index.js)  
 `//引入组件`
 import { 
 	createRouter,
 	createWebHashHistory                    
 } from 'vue-router'
 `//定义路由`
 const routes = []                          
 `//创建路由实例`
 const router = createRouter({              
 	history: createWebHashHistory(),
    routes: routes
 })
 export default router

#4. 创建及加载实例 (main.js)  
 import router from './router'              `//引入文件`
 createApp(App).use(ElementPlus).use(router).mount('#app')   `//应用文件`
```

### 5. alias

```shell
#1. 引入路径模块 (vite.config.js)
 import path from "path"

#2. 定义别名地址
 export default defineConfig({
 	resolve: {
    	alias: {
      		"~": path.resolve(__dirname, "src")   `// src路径 -> ~`
    	}
	},
	plugins: [vue(), WindiCSS(),],
 })
```

### 6. 404 页面

```shell
#1. 创建文件夹 pages
 > src\pages           `//用于存放页面文件`

#2. 创建页面路由 (src\router\index.js)
 `//引入页面文件`
 import Index from '~/pages/index.vue'
 import NotFound from "~/pages/404.vue"
 `//配置页面路由`
 const routes = [
 {
    path: "/", component: Index
 }, {
 	path: '/:pathMatch(.*)*', name: 'NotFound', component: NotFound
 }]

#3. 创建 404 页面页面 (src\pages\404.vue)
 `//通过 element-plus 提供 Result 结果 `
 <template>
    <div>
        <el-result icon="warning" title="404提示" sub-title="你找的页面走丢了~">
            <template #extra>
            	`//$router.push('/') 返回指定地址`
                <el-button type="primary" @click="$router.push('/')">回到首页</el-button>  
            </template>
        </el-result>
    </div>
</template>
```

### 7. ICONS

```shell
#1. 安装 
 > npm install @element-plus/icons-vue
 
#2. 引入 
 `局部`
 <script setup>	
 	import {Search} from '@element-plus/icons-vue'
 </script>
 
 `全局` 
  < main.js >
  import * as ElementPlusIconsVue from '@element-plus/icons-vue'
  for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)  //引入全局图标
  }

#3. 使用 
 `属性`
 <el-input v-model = "input1" :suffix-icon = "search" />
	
 `插槽`
 <el-input v-model="form.username" placeholder="请输入用户名">
    <template #prefix>
        <el-icon><User /></el-icon>
    </template>
</el-input> 	
```



### 8. axios

```shell
#1. 安装
 > npm install axios

#2. 建文件及文件夹
 > scr/axios.js                           `//建立新文件`
 > src/api							   `//建立新文件夹`

#3. 引用 (src/axios.js)  
 import axios from "axios"
 // 创建 axios 实例
 const service = axios.create({
    baseURL: "http://ceshi13.dishait.cn/"      `// 域名通用部分`
 })
 // 实例进行默认导出
 export default service
 
#4. 跨域问题修复 (vite.config.js)
export default defineConfig({
  
  //跨域问题修复
  server: {
    proxy: {
      '/api': {
        target: `http://ceshi13.dishait.cn`,      `// 此处写 api 接口地址`
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, '')
      },
    }
  },
})
```





## 登录页面

### 1. 主页面

<img src="Pictures/image-20230817153632699.png" alt="image-20230817153632696"  />



#### HTML

* 结构分成左右两部分，页面布局比例是 6:3
* 右侧 **用户名**、**密码**、**登录** 通过 <font color = orange>element-plus</font > 表单实现
* 登录按钮设置宽 = 表单宽，账号密码登录文字是通过三个 <span > 组合

```vue
<template>
    <div class="container">
        <!-- 左侧窗口 -->
        <div class="left">
            <div>
                <!-- 主副标题 -->
                <div class="ltitle a">欢迎光临</div>
                <div class="ltitle b">此站点是 《vue3 + vite实战商城后台开发》 视频课程的演示地址</div>  
            </div>
        </div>
    
        <!-- 右侧窗口 -->
        <div class="right">
            <!-- 右侧窗口标题文字 -->
            <h2 class="rtitle a">欢迎回来</h2>
            <div class="rtitle b">
                <span class="horizontal"></span>
                <span>账号密码登录</span>
                <span class="horizontal"></span>
            </div>
            <!-- 右侧窗口表单 -->
            <el-form :model="form" class="rform">
            <el-form-item >
                <el-input v-model="form.username" placeholder="请输入用户名" />
            </el-form-item>
            <el-form-item >
                <el-input v-model="form.password" placeholder="请输入密码" />
            </el-form-item>    
            <el-form-item>
                <el-button round color="#6a6aef" class="rfbutton" type="primary" @click="onSubmit">登 录</el-button>
            </el-form-item>
        </el-form>
        </div>
    </div>
</template>
```

#### Script

```vue
<script setup>
    import { reactive } from 'vue'
    // do not use same name with ref
    const form = reactive({
        username:"",
        password:""
    })

    const onSubmit = () => {
        console.log('submit!')
    }
</script>
```

#### CSS

```vue
<style scoped>
    .container{
        /****************************************
        *   容器样式
        *   1. 设置 flex 布局
        *   2. 屏幕高度 100vh
        *   3. 屏幕宽度 100vw
        *   4. windi css 设置背景色 indigo-500
        *****************************************/
        display:flex;
        min-height: 100vh;
        min-width: 100vw;
        @apply bg-indigo-500;
    }
    
    .left{
        /****************************************
        *   左侧样式
        *   1. 子容器设置占比 6/9 
        *   2. windi css 设置 flex 布局
        *   3. windi css 设置水平居中
        *   4. windi css 设置垂直居中
        *   5. windi css 设置子项方向纵向 
        *****************************************/
        flex:6;
        @apply  flex items-center justify-center flex-col;
    }
    
    .ltitle{
        /****************************************
        *   左侧通用标题
        *   1. windi css 设置文字颜色 light-50
        *   2. windi css 设置文字间距 4
        *****************************************/
        @apply text-light-50 mb-4;
    }
    
    .ltitle.a{
        /****************************************
        *   左侧主标题
        *   1. windi css 设置字体加粗
        *   2. windi css 设置文字号 5xl
        *****************************************/    
        @apply font-bold text-5xl;
    }
    
    .ltitle.b{
        /****************************************
        *   左侧副标题
        *   1. windi css 设置文字颜色 text-gray-200
        *   2. windi css 设置文字号 text-sm
        *****************************************/
        @apply  text-gray-200 text-sm;
    }    
        
    .right{
        /****************************************
        *   右侧样式
        *   1. 子容器设置占比 3/9 
        *   2. windi css 设置背景颜色 light-50  
        *   3. windi css 设置 flex 布局 
        *   4. windi css 设置水平居中 
        *   5. windi css 设置垂直居中
        *   6. windi css 设置子项方向纵向 
        *****************************************/
        flex:3;
        @apply bg-light-50 flex items-center justify-center flex-col;
    }

    .rtitle.a{
        /****************************************
        *   右侧主标题
        *   1. windi css 设置字体加粗
        *   2. windi css 设置文字号 3xl
        *   3. windi css 设置文字颜色 gray-800
        *****************************************/
        @apply font-bold text-3xl text-gray-800;
    }    
    
    .rtitle.b{
        /****************************************
        *   右侧副标题
        *   1. windi css 设置 flex 布局
        *   2. windi css 设置水平居中
        *   3. windi css 设置垂直居中
        *   4. windi css 设置外间距 5
        *   5. windi css 设置文字颜色 gray-300
        *   6. windi css 设置子项目间距 x-2
        *****************************************/
        @apply flex items-center justify-center my-5 text-gray-300 space-x-2;
    }    
    
    .horizontal{
        /****************************************
        *   右侧副标题横线
        *   1. windi css 设置高 1px
        *   2. windi css 设置宽 16        
        *   3. windi css 设置背景颜色 gray-200
        *****************************************/
        @apply h-[1px] w-16 bg-gray-200;
    }
    
    .rform{
        /****************************************
        *   右侧提交表单        
        *   1. windi css 设置宽 250px
        *****************************************/
        @apply w-[250px];
    }
   
    .rfbutton{
        /****************************************
        *   右侧提交表单按钮        
        *   1. windi css 设置宽 250px
        *****************************************/
        @apply w-[250px];
    }
</style>
```



### 2. 验证规则

#### 元素

* 验证表单中输入是否正确，通过 **element-plus** 提供属性支持
* 条件一： 添加 rules 对象及内容，名称和 form 中定义名称相同
* 条件二：`<el-form-item>` 添加 `prop` 属性，属性值和 form 中定义名称相同



**html**

```vue
<template>
	<!-- 1. 在表单中添加 rules 属性 -->
	<el-form :model="form" :rules="rules">
		<!-- 2. 添加属性名称 prop -->
		<el-form-item prop="username">    
    		<el-input v-model="form.username"></el-input>
    	</el-form-item>
    </el-form>
</template>
```

 **script**

```vue
<script setup>
    const form = reactive({
    	username:[],
        password:[]
    })
    
    // 1. 添加 rules 对象其名称同 form 中元素
    const rules = {
        username:[            
            {
                required: true,                 // 必填项
                message: '用户名不能为空',       // 提示
                trigger: 'blur'                 // 规则触发条件
            },
        ],        
        password:[
            {
                required: true,                 // 必填项
                message: '密码不能为空',         // 提示
                trigger: 'blur'                 // 规则触发条件
            },
        ]
    }
</script>
```

#### 提交

* 用于表单提交时，检测表单中元素规则
* 在`<el-form>` 中添加 `ref = formRef` 属性
* 在`Script` 中定义 `formRef`变量及其事件

**html**

``` vue
<template>
    <!-- 1. 在表单中添加 ref 属性 -->
    <el-form ref="formRef" :model="form" :rules="rules" class="rform">
</template>
```

**script**

```vue
<script>
	const formRef = ref(null)       // 用于点击登录按钮时验证规则            
	const onSubmit = () => {
    	formRef.value.validate((valid,fields)=>{
        	if(!valid){
            	return false       // valid 假返回 false 真就通过 
            }
            console.log("验证通过");
        })
    }
</script>
```



### 3. 登录请求

#### axios 请求

* 创建请求文件  <font color=orange>  `src/api/manager.js` </font>

```javascript
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
```

#### 执行请求

* 在文件 <font color=orange>`src/pages/login.vue`</font> 中执行请求

```vue
<script setup>
	import { login } from '~/api/manager'   // 导入登录请求 axios
    
    const onSubmit = () => {
        // 执行登录请求 axios
        login(form.username,form.password)
        .then(res =>{
            console.log(res.data.data);              // 请求登录信息正常
        })
        .catch(err=>{
            console.log(err.response.data.msg);      // 请求登录信息不正确
        }) 
    })     
    } 
</script>
```



### 4. 登录成功

#### 转入页面

* 利用 <font color=orange>`vue-router`</font>实现新页面转入

```vue
<script setup>
	import { useRouter } from 'vue-router'         // 用于登录成功，转入新页面
    const onSubmit = () => {
        // 跳转到后台主页
        router.push("/")
    }
</script>
```



### 5. Cookie 存储 

* 使用 **Cookie** 存储 token 来区分用户身份



#### 安装 VueUse

```shell
#1. 安装 VueUse
 > npm i @vueuse/integrations

#2. 安装 useCookies
 > npm i universal-cookie

#3. 引入 Cookies <script>
 import { useCookies } from '@vueuse/integrations/useCookies'  `//引入组件模块`
 const cookie = useCookies()                                   `//取得组件方法` 
 
```



#### 保存 Token

```vue
<script setup>
	import { useCookies } from '@vueuse/integrations/useCookies'
    const cookie = useCookies()
    // 存储 token 和用户相关信息
    const cookie = useCookies()
    cookie.set("admin-token",res.data.data.token)
</script>
```



### 6. Axios 拦截器

#### 请求拦截

* 请求拦截器允许你在发出请求之前对请求进行修改、添加请求头或进行其他处理
* **认证和授权：** 在每个请求中添加身份验证的令牌、认证头部等信息，确保请求能够通过认证和授权机制。
* **全局 Loading 效果：** 在请求开始时展示一个加载中的效果，请求完成后关闭
* **请求参数加工：** 对请求参数进行加密、编码或其他处理，确保请求的参数满足服务端的要求
* **日志记录：** 记录每个请求的详细信息，以便于调试和监控

```js
/* src/axios.js */
import axios from "axios"
import { ElNotification } from 'element-plus'  // 引入 element-plus Notification
import { useCookies } from '@vueuse/integrations/useCookies'

// 1. 创建 axios 实例
	

// 2. 添加请求拦截器
service.interceptors.request.use(function (config) {
    // 在请求 header 头自动添加token , 在登录时存入token, 以后请求就能省略 Token
    const cookie = useCookies()
    const token = cookie.get("admin-token")
    if (token) {
        config.headers["token"] = token
    }

    return config;
}, function (error) {
    // 对请求不正确操作
    return Promise.reject(error);
});

// 3. 添加响应拦截器
	

// 实例进行默认导出
export default service
```





#### 响应拦截

* 响应拦截器允许你在收到响应数据之前对响应进行处理
* **全局错误处理：** 在响应返回后检查状态码，根据状态码执行不同的操作，如重定向到错误页面或显示错误提示
* **数据处理：** 对返回的数据进行处理，如解密、解压、格式化等，确保数据能够被正确处理
* **统一格式化：** 将不同接口返回的数据统一格式化为特定的数据结构，方便前端处理
* **Token 刷新：** 在响应中可能会返回更新的身份验证令牌，你可以在响应拦截器中更新本地存储的令牌

```js
/*  src/axios.js  */ 
import axios from "axios"
import { ElNotification } from 'element-plus'  

// 1. 创建 axios 实例


// 2. 添加请求拦截器


// 3. 添加响应拦截器
service.interceptors.response.use(function (response) {
    // 对响应数据做设置
    return response.data.data;       // 返回响应数据 response.data.data
}, function (error) {
    // 对响应不正确做通知
    ElNotification({
        message: error.response.data.msg || "请求失败",
        type: 'error',
        duration: 3000
    })
    return Promise.reject(error);
});

// 实例进行默认导出
export default service
```



### 7. 工具库封装 

* 能够精简代码



#### 准备

```shell
# 1. 建立文件夹
 > src/composables               `建立文件夹存放工具库`
```



#### auth.js

* 用于封装 useCookies 相关操作 

```js
import { useCookies } from '@vueuse/integrations/useCookies'
const TokenKey = "admin-token"
const cookie = useCookies()

// 1. 获取token
export function getToken() {
    return cookie.get(TokenKey)
}

// 2. 设置token
export function setToken(token) {
    return cookie.set(TokenKey, token)
}

// 3. 清除token
export function removeToken() {
    return cookie.remove(TokenKey)
}

```



#### util.js

* 封装工具用于通知

```js
import { ElNotification, ElMessageBox } from 'element-plus'  // 引入 element-plus Notification

// 消息提示工具
export function toast(message, type = "success", dangerouslyUseHTMLString = false) {
    ElNotification({
        message,
        type,
        dangerouslyUseHTMLString,
        duration: 3000
    })
}

// 弹出窗口工具
export function showModal(content = "提示内容", type = "warning", title = "") {
    return ElMessageBox.confirm(
        content,
        title,
        {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type,
        }
    )
}
```



### 8. vuex 状态管理

#### 描述

* **作用：**在 `vue` 中每个组件都有自己 `data`，`template`和 `methods`, `data`是数据，我们叫做状态，通过 `methods` 中方法改变状态更新视图

    		 单组件中很方便，多组件共享同一状态时，传递就会比较麻烦，我们就能够引进 `Vuex` 来进行状态管理，负责**组件中通信**

* **定义**

```js
/* src/store/index.js */

// 导入 Vue
import Vue from 'vue'
// 导入 Vuex 插件 'vuex'
import Vuex from 'vuex'

// 把 Vuex 注册到 Vue 上
Vue.use(Vuex)

const store = createStore({
    // 函数用来存储状态
    state:(){
  	},
  	// 用来处理状态
  	mutations:{
  	},
  	// 用于异步处理
  	actions:{
  	},
  	// 等价于 store 计算属性, 根据 state 派生出状态
  	getters:{
  	}
})
export default store
```

* **存储 / 加载**

```js
// 加载 vuex 
import { useStore } from 'vuex'
import { mapState } from 'vuex'  // mapState 同时取多状态 
const store = useStore()

// 访问state
 1. this.$store.state.xxx
 2. count: computed(() => store.state.count)
 3. storeArr = mapState(['name','age'])         
 4. storeObj = mapState({
    	sName: state => state.name,
     	sage: state => state.age
 	})

// 访问getter
this.$stroe.getters.xxx
double: computed(() => store.getters.doubleCount)

// 使用 mutation
store.commit('xxx')
increment: () => store.commit('increment')

// 使用 action
store.dispatch('xxx')
asyncIncrement: () => store.dispatch('asyncIncrement')
```



#### 结构

```css
# main.js  ->  src/store/index.js 
```

```css
└── src
	├── store                     # (folder) 状态定义文件夹
	    ├── index.js              # (file)   定义入口文件      
	    ├── 
	└── pages                     # (folder) 页面文件夹执行存储  
```



#### 安装

```shell
# 1. 安装
 > npm install vuex@next --save
 
# 2. 创建文件夹
 > src/store               `创建 store 文件夹`
 > src/store/index.js      `创建 index.js 状态管理文件`
 
# 3. 创建实例  </src/store/index.js>
 import {createStore} from 'vuex
 // 创建一个实例
 const store = createStore({
    state() {
        return {
            // 用户信息
            user: {}
        }
    },
    mutations: {
        // 记录用户信息
        SET_USERINFO(state, user) {
            state.user = user
        }
    }
 })
 export default store
 
# 4. 引入文件 </src/main.js>, 把 store 挂载到 Vue 之后 ，所有的组件就可以直接从 store 中获取全局数据了  
 import store from './store'
 app.use(store)
 app.mount('#app')
```

#### 使用

```vue
<script setup>
	import { useStore } from 'vuex'         // 使用 vuex 管理 
    const store = useStore()
    
</script>
```



### 9. 路由拦截

* 通过前置路由守卫，能防止用户不登陆，和用户反复进行登录

#### 准备工作

```shell
#1. 创建新文件 
 > src/permission.js       `此文件记录权限信息`

#2. 引入文件 <main.js>
 import "./permission"        // 引入权限文件
```



#### 前置守卫

````js
<src/permission.js>  

import router from "~/router"
import { getToken } from "~/composables/auth"

// 全局前置守卫
router.beforeEach((to, from, next) => {
    const token = getToken()

    // 权限不通过，强制返回主页
    if (!token && to.path != "/login") {
        return next({ path: "/login" })
    }

    // 权限通过正常放行
    next()
})


````



### 10. 完善登录

#### 获取用户信息

**步骤一**

* 操作：将 **getinfo** 代码从 **login** 文件转到路由前置 **permission.js**  ，让数据持久有效
* 原因：只在首次登录能取得用户信息 ，在前置守卫中能保证页面刷新重新取用户数据

```javascript
/**************************************************    
*  登录成功了获取用户信息
*  规则： token 数据正常存在 
*  操作： 执行 getinfo 把用户信息存储在 vuex 共享当中
* *************************************************/
if (token) {
    await store.dispatch("getinfo")
}
```

**步骤二**

* 在 store/index.js 中添加 actions 事件执行 mutations 中 SET_USERINFO 

```javascript
const store = createStore({
state() {
    return {
        // 用户信息
        user: {}
    }
},
mutations: {
    // 记录用户信息
    SET_USERINFO(state, user) {
        state.user = user
    }
},
actions: {
    // 获取当前登录用户信息
    getinfo({ commit }) {        // 通过解构赋值 {commit} = store.commit
        return new Promise((resolve, reject) => {
            getinfo().then((res) => {     // 执行api/manager中getinfo将数据 res 返回 
                commit("SET_USERINFO", res)  // 把返回数据 res 给 SET_USERINFO 事件执行
                resolve(res)
            }).catch(err => reject(err))
        })
    }
}
})

export default store
```



####  精简 login.vue

操作：将用户验证环节，转到 Vuex 中进行，优化精简 login.vue 代码数量及质量

**步骤一**

```javascript
// 状态管理文件 store/index.js
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
```

**步骤二**

```javascript
// 登录页面文件 login.vue
const onSubmit = () => {
        formRef.value.validate((valid,fields)=>{
            if(!valid){
                return false
            }
            loading.value = true                    // 加载时 loading

            store.dispatch("login",form).then((res)=>{
            // 提示登录成功
                toast("登录成功")
            // 跳转到后台主页
                router.push("/")
            }).finally(()=>{
                loading.value = false      // 结束加载时 loading
            })
        })
```



#### 监听回车事件

作用：用户登录时，按回车键代替登录按钮

**步骤一**

```javascript
// 用户登录页面 login.vue

// 监听回车事件
    function onKeyUp(e){
        if(e.key=="Enter") onSubmit()
    }
```

步骤二

```javascript
// 用户登录页面 login.vue

// 添加键盘监听 (在页面加载成功时)
    onMounted(()=>{
        document.addEventListener("keyup",onKeyUp)
    })
    // 移除键盘监听 (在页面卸载时)
    onBeforeUnmount(()=>{
        document.removeEventListener("keyup",onKeyUp)
    })
```



### 11. 退出登录

#### 创建接口

```javascript

// 请求接口文件 src/api/manager.js  
/* ******************** 3. 定义登出方法 *****************************
    1. 接口URL
        http://ceshi13.dishait.cn/admin/logout

    2. 请求方式
        POST
       Content-Type
        application/x-www-form-urlencoded

    3. 请求Body参数
        参数名	    示例值	        参数类型	是否必填	参数描述
        token	    1bd....772	    Text	    是	    用户token
********************************************************************/
export function logout() {
    return axios.post("/admin/logout")
}
```



#### 状态清除

```javascript
// 状态管理文件 src/store/index.js
actions: {
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
}
```

#### 执行操作

```javascript
// 在主页面文件 src/pages/index.vue
<script setup>
    import { logout } from "~/api/manager"
    import { showModal,toast } from "~/composables/util"
    import {useRouter} from "vue-router"
    import { useStore } from "vuex"

    const router = useRouter()
    const store = useStore()

    function handleLogout(){
        showModal("是否要退出登录").then((res)=>{
            logout().finally(()=>{
                // 清除用户状态及 cookie
                store.dispatch("logout")
                // 跳转回登录页
                router.push("/login")
                // 提示退出登录成功
                toast("退出登录成功")
            })
        }).catch()
    }
</script>
```



### 12. 全局 loading

#### 安装 nprogress

```javascript
> npm i nprogress
```



#### 引入 nprogress

```javascript
// main.js
// import './style.css'
import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import App from './App.vue'
import router from './router'
import store from './store'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import 'virtual:windi.css'
const app = createApp(App)
app.use(store)
app.use(router)
app.use(ElementPlus)
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)  //引入全局图标
}
import "./permission"        // 引入路由权限文件

import "nprogress/nprogress.css"

app.mount('#app')

```



#### 封装工具

```javascript
// src/composables/util.js
import nprogress from 'nprogress'
// 显示全屏 loading
export function showFullLoading(){
    nprogress.start()
}

// 隐藏全屏 loading
export function hideFullLoading(){
    nprogress.done()
}
```



#### 设置样式

```vue
// app.vue
<style >
#nprogress .bar{
  background-color:#f4f4f4!important;
  height: 3px!important;
}

</style>
```



#### 设置全局 loading

```js
// permission.js
// 全局前置守卫开启
router.beforeEach(async (to, from, next) => {
    // 显示 loading
    showFullLoading()
// 全局后置守卫关闭
router.afterEach((to, from) => {
    // 隐藏 loading
    hideFullLoading()
})
```



### 动态页面标题

#### 添加标题文字

```javascript
// src/router/index.js 
// 定义路由地址,对象添加属性 meta:{title = xxx}
const routes = [
    {
        path: "/", component: Index, meta: { title: "后台首页" }
    }, {
        path: "/login", component: Login, meta: { title: "登录页" }
    }, {
        path: '/:pathMatch(.*)*', name: 'NotFound', component: NotFound
    }
]
```



#### 动态修改标题

```javascript
// permission.js 
// 设置页面标题
// to.meta.title 有数据则设置没有则清空
let title = (to.meta.title ? to.meta.title : "") + "-地莎编程商城后台" 
document.title = title
next()
```



## 全局布局

### 1. 主布局

#### 生成布局结构

* 建立文件夹 `src/layouts`
* 建立布局文件 `src/layouts/admin.vue`
* 建立布局子文件夹 `/src/layouts/components`
* 建立头部组件 `FHeader.vue`
* 建立侧边组件 `FMenu.vue`
* 建立标签导航组件 `FTagList.vue`

```css
router/index.js ->  layouts/admin.vue  ->  layouts/components/xxx.vue
```

```css
└── src
	├── layouts                  # (folder) 页面文件夹  
	    ├── components           # (folder) 布局组件文件夹                 
	        ├── FHeader.vue      # (file)   头布局组件        
 	        ├── FMenu.vue        # (file)   侧边布局组件    
	        ├── FTagList.vue     # (file)   标签导航布局组件       
	    └──	admin.vue            # (file)   主布局文件定义
	├── router                   # (folder) 路由文件夹 
	    ├── index.js             # (file)   路由定义文件
	
```



#### 路由定义设置

```javascript
// src/router/index.js
import Admin from "~/layouts/admin.vue"
// 定义路由地址
const routes = [
    {
        path: "/",
        component: Admin,
        // 子路由
        children: [{
            path: "/",
            component: Index,
            meta: { title: "后台首页" }
        }]

    }, {
        path: "/login", component: Login, meta: { title: "登录页" }
    }, {
        path: '/:pathMatch(.*)*', name: 'NotFound', component: NotFound
    }
]
```



#### 主布局定义

```vue
<template>
    <el-container>
        <el-header>
            <f-header/>
        </el-header>
        <el-container>
            <el-aside>
                <f-menu></f-menu>
            </el-aside>
            <el-main>
                <f-tag-list/>
                <router-view></router-view>
            </el-main>
        </el-container>
    </el-container>
</template>
<script setup>
    import FHeader from './components/FHeader.vue';
    import FMenu from './components/FMenu.vue';
    import FTagList from './components/FTagList.vue';
</script>
<style scoped>
</style>
```



### 2. 头开发

#### 主结构

```vue 
// layouts/components/FHeader.vue
<template>
    <div class="f-header">
        <span class="logo">
            <el-icon class="logopic"><Sunrise /></el-icon>
            帝莎编程
        </span>
        <el-icon class="icon-btn"><Fold /></el-icon>
        <el-icon class="icon-btn"><Refresh /></el-icon>
        <div class="right">
            <el-icon class="icon-btn"><FullScreen /></el-icon>
            <el-dropdown class="dropdown">
                <span class="el-dropdown-link">
                    <el-avatar :size="25" :src="$store.state.user.avatar" />
                    {{$store.state.user.username}}
                    <el-icon class="el-icon--right">
                        <arrow-down />
                    </el-icon>
                </span>
                <template #dropdown>
                    <el-dropdown-menu>
                        <el-dropdown-item >修改密码</el-dropdown-item>
                        <el-dropdown-item >退出登录</el-dropdown-item>
                    </el-dropdown-menu>
                </template>
            </el-dropdown>
        </div>
    </div>
</template>
<script setup>

</script>
<style>
    .f-header{
        /************************************************************
        *   头部通用布局设置
        *   1. windi css 设置垂直居中 items-center
        *   2. windi css flex 布局
        *   3. windi css 设置背景色 bg-indigo-700
        *   4. windi css 设置文字颜色 text-light-50
        *   5. windi css 设置位置顶部固定 fixed top-0 left-0 right-0;
        *************************************************************/
        @apply flex items-center bg-indigo-700 text-light-50 fixed top-0 left-0 right-0;
        height: 64px;
    }
    .right{
        /************************************************************
        *   头部右侧布局设置
        *   1. windi css 设置位置右对齐 ml-auto
        *   2. windi css 设置垂直方向居中 justify-center items-center
        *************************************************************/        
        @apply ml-auto flex justify-center items-center;
    }
    .logo{
        /************************************************************
        *   头部 logo 布局
        *   1. 设置宽度 250px
        *   2. windi css 设置布局垂直、水平均居中 
        *   3. windi css 设置字体 text-xl font-thin
        *************************************************************/   
        width: 250px;
        @apply flex justify-center items-center text-xl font-thin;
    }
    .logopic{
        /************************************************************
        *   logo 图片设置 
        *   1. windi css 设置间隔 mr-1 ( margin-right: 02.5rem; )
        *************************************************************/ 
        @apply mr-1;
    }
    .icon-btn{
        /************************************************************
        *   通用图片按钮 
        *   1. windi css flex 布局垂直水平居中
        *   2. 宽和高 41px 65px
        *   3. 鼠标经过图标 
        *************************************************************/
        @apply flex justify-center items-center;
        width: 41px;
        height: 65px;
        cursor: pointer;
    }
    .icon-btn:hover{
        /************************************************************
        *   通用图片鼠标经过 
        *   1. windi css 经过背景颜色变浅
        *************************************************************/
        @apply bg-indigo-600;
    }    
    .f-header .dropdown{
        /************************************************************
        *   右侧下拉菜单 
        *   1. 设置高  65px
        *   2. 鼠标经过图标 cursor: pointer
        *   3. windi css 垂直水平居中
        *************************************************************/
        height: 65px;
        cursor: pointer;
        @apply flex justify-center items-center mx-5 ;
    }
    .right span{
        /************************************************************
        *   右侧下拉菜单
        *   1. windi css 设置文字颜色 text-light-50
        *   2. windi css 设置字符间距 mr-2
        *   3.  垂直水平居中
        *************************************************************/
        @apply text-light-50 mr-2;
    }
</style>
```



#### 退出登录

```vue
// src/Layouts/components/FHeader.vue
<template>
	// 下拉菜单添加事件 @command="handleCommand"
    <el-dropdown class="dropdown" @command="handleCommand">
        // 子菜单项添加识别字符 command="rePassword"
        <el-dropdown-item command="rePassword">修改密码</el-dropdown-item>
        <el-dropdown-item command="logout">退出登录</el-dropdown-item>
</template>

<script setup>
    import { logout } from "~/api/manager"
    import { showModal,toast } from "~/composables/util"
    import {useRouter} from "vue-router"
    import { useStore } from "vuex"

    const router = useRouter()
    const store = useStore()

    // 监听下拉菜单事件
    const handleCommand =(c)=>{
        switch (c) {
            case "logout":
                handleLogout()
                break;
            case "rePassword":
                console.log("修改密码");
                break;
        }
    }

    // 退出登录按钮事件 
    function handleLogout(){
        showModal("是否要退出登录").then((res)=>{
            logout().finally(()=>{
                // 清除用户状态及 cookie
                store.dispatch("logout")
                // 跳转回登录页
                router.push("/login")
                // 提示退出登录成功
                toast("退出登录成功")
            })
        }).catch()
    }
</script>

```



#### 刷新全屏

步骤一：刷新按钮

```vue
<template>
	<!-- 头部刷新按钮 -->
    <el-tooltip effect="dark" content="刷新" placement="bottom">
        <el-icon class="icon-btn" @click="handleRefresh">
            <Refresh />
        </el-icon>
    </el-tooltip>
</template>

<script setup>
    // 刷新按钮事件
    const handleRefresh=()=> location.reload()
</script>
```



步骤二：全屏按钮

* 安装 VueUse  组件

```bash
# npm i @vueuse/core
```

* 执行 VueUse  组件

```vue
<template>            
	<!-- 右边全屏按钮 -->
    <el-tooltip effect="dark" content="全屏" placement="bottom">
        <el-icon class="icon-btn" @click="toggle">
            <FullScreen v-if="!isFullscreen" />
            <Aim v-else />
        </el-icon>
    </el-tooltip>
</template>

<script setup>
    import { useFullscreen } from '@vueuse/core'   // 引入全屏组件 vueuse
    
    // 定义全屏执行事件
    const { isFullscreen, toggle } = useFullscreen()
</script>
```



#### 修改密码

```vue
<template>
    <!-- 下拉菜单文字及图像 -->
    <el-dropdown class="dropdown" @command="handleCommand">
        <span class="el-dropdown-link">
            <el-avatar :size="25" :src="$store.state.user.avatar" />
            {{$store.state.user.username}}
            <el-icon class="el-icon--right">
                <arrow-down />
            </el-icon>
        </span>
        <!-- 下拉菜单子选项 -->
        <template #dropdown>
            <el-dropdown-menu>
                <el-dropdown-item command="rePassword">修改密码</el-dropdown-item>
                <el-dropdown-item command="logout">退出登录</el-dropdown-item>
            </el-dropdown-menu>
        </template>
    </el-dropdown>
      
    
    <!-- 加载抽屉组件 -->
    <form-drawer 
    ref="formDrawerRef" 
    title="修改密码" 
    destroyOnClose 
    @submit="onSubmit">
        <!-- 用户修改密码表单容器 -->    
        <el-form ref="formRef" 
        :model="form" 
        :rules="rules" 
        label-width="80px" 
        size="small">
            <!-- 旧密码输入 -->
            <el-form-item prop="oldpassword" label="旧密码">
                <el-input type="password" v-model="form.oldpassword" placeholder="请输入旧密码">
                </el-input>
            </el-form-item>
            
            <!-- 新密码输入 -->
            <el-form-item prop="password" label="新密码">
                <el-input type="password" v-model="form.password" placeholder="请输入密码" >
                </el-input>
            </el-form-item>    
            
            <!-- 确认新密码输入 -->
            <el-form-item prop="repassword" label="确认密码">
                <el-input type="password" v-model="form.repassword" placeholder="请输入确认密码" >
                </el-input>
            </el-form-item>  
        </el-form>
    </form-drawer>
</template>

<script setup>
    import FormDrawer from "~/components/FormDrawer.vue"  // 引入抽屉组件

    //  定义子组件接收变量
    const formDrawerRef = ref(null)
    // 定义验证规则 
    const rules = {
        oldpassword:[
            {
                required: true,                 // 必填项
                message: '旧密码不能为空',       // 提示
                trigger: 'blur'                 // 规则触发条件
            },
        ],
        password:[
            {
                required: true,                    // 必填项
                message: '新密码不能为空',            // 提示
                trigger: 'blur'                    // 规则触发条件
            },
        ],
        repassword:[
            {
                required: true,                    // 必填项
                message: '确认密码不能为空',            // 提示
                trigger: 'blur'                    // 规则触发条件
            },
        ]
    }
    
    const formRef = ref(null)                       // 用于点击登录按钮时验证规则
    
    
    // 定义提交按钮事件
    const onSubmit = () => {
        formRef.value.validate((valid,fields)=>{
            if(!valid){
                return false
            }
            formDrawerRef.value.showLoading()                    // 加载时 loading
            updatepassword(form)
            .then(res=>{
                toast("修改密码成功，请重新登录")
                store.dispatch("logout")
                router.push("/login")
            })
            .finally(()=>{
                formDrawerRef.value.hideLoading()
            })
           
        })
    }


    // 监听下拉菜单事件
    const handleCommand =(c)=>{
        switch (c) {
            case "logout":
                handleLogout()
                break;
            case "rePassword":
                formDrawerRef.value.open()
                break;
        }
    }

    // 刷新按钮事件
    const handleRefresh=()=> location.reload()

    // 退出登录按钮事件 
    function handleLogout(){
        showModal("是否要退出登录").then((res)=>{
            logout().finally(()=>{
                // 清除用户状态及 cookie
                store.dispatch("logout")
                // 跳转回登录页
                router.push("/login")
                // 提示退出登录成功
                toast("退出登录成功")
            })
        }).catch()
    }
</script>

<style>
    ...
</style>
```





### 3. 封装抽屉组件

#### 语法糖

* **defineProps**

  ```js
  /***********************************************************
   *  defineProps()
   *  作用：此函数来定义父组件传递 props
   *  语法：defineProps({
   *            msg:{
   *              type: String,
   *              require: true,
   *              default: "xxx"
   *            }
   *        })
   *  通讯方向：父组件 -> 子组件
   ************************************************************/
  ```

  ```vue
  父组件
  <template>
      <div class="A">
          <B msg="A -> B STR"></B>   <!-- 传递属性数据 -->
      </div>
  </template>
  <script setup>
      import B from './B.vue'
  </script>
  <style scoped>
      .A{
          background: fuchsia;
      }
  </style>
  ```

  ```vue
  子组件
  <template>
      <div class="msg">{{ msg }}</div>
  </template>
  <script setup>   
      defineProps({                     // 定义接受属性
          msg:{
              type:String,
              requite:true,
              default:" msgstr"
          }
      })
  </script>
  <style scoped>
      .msg{
          color: indigo;
      }
  </style>
  ```

  

* **defineEmits**

  ```js
   /*********************************************************************
   *  defineEmits
   *  作用：子组件接受父组件方法 
   *  语法: 
   *      父组件
   *          <子组件 @方法名 = "函数名">                 // 发送方法
   * 
   *      子组件
   *          const emit = defineEmits(["父组件方法名"])   // 定义接受
   *          emit("父组件方法名",参数)                    // 执行方法
       *********************************************************************/
  ```

  ```vue
  父组件
  <template>
      <B @change = "changeFun" @delete = "deleteFun"></B>
  </template>
  <script setup>
      import B from './B.vue'
      const changeFun = (val)=>{
          console.log("changeFun",val);   
      }
      const deleteFun = (val)=>{
          console.log("deleteFun",val);
      }
  </script>
  <style scoped>
  </style>
  ```

  ```vue
  子组件
  <template>
      <button @click="btnChange">Change</button>
      <button @click="btnDelete">Delete</button>
  </template>
  <script setup>
      const emit = defineEmits(['change','delete'])
      const btnChange = ()=> emit("change",7)
      const btnDelete = ()=> emit("delete",7)
  </script>
  <style scoped>
  </style>
  ```

  

* **defineExpose**

  ```js
  /**************************************************************
   *  defineExpose
   *  作用：子组件暴露自己属性、方法
   *  语法：
   *      父组件
   *          <子组件 ref="xxx"></子组件>
   *          const xxx = ref(null)
   *          xxx.value.方法名()
   *          xxx.value.属性名
   *      
   *      子组件
   *          defineExpose({
   *              方法名,
   *              属性名: 属性值
   *          })
   *  通讯方向： 子组件 -> 父组件
   **************************************************************/   
  ```

  ```vue
  父组件
  <template>
      <B ref="xxx"></B>
      <button @click="componafun">button</button>
  </template>
  <script setup>
      import B from "./B.vue"
      import {ref} from "vue"
      const xxx = ref(null)
      const componafun = ()=>{
          console.log(xxx.value.age)
          xxx.value.running()
      }
  </script>
  <style scoped>
  </style>
  ```

  ```vue
  子组件
  <template>
          ComponB
  </template>
  <script setup>
      import {ref} from 'vue'
      const age=ref(99)
      const running = ()=>{
          console.log("running");
      }
      
      defineExpose({ age,running })
  </script>
  <style scoped>
  </style>
  ```



#### 抽屉结构

```html
<template>
    <!-- 抽屉通用代码 -->
    <el-drawer 
    v-model = "showDrawer" 
    :title = "title" 
    :size = "size" 
    :close-on-click-modal = "false"
    :destroy-on-close = "destroyOnClose">
        <!-- 表单显示部分 -->
        <div class="formDrawer">
            <!-- 正文 -->
            <div class="body">
                <slot></slot>
            </div>
            <!-- 按钮 -->
            <div class="actions">
                <el-button class="rfbutton" type="primary" @click="submit" :loading="loading">{{ confirmText }}</el-button>
                <el-button class="rfbutton" type="default" @click="close">取消</el-button>
            </div>
        </div>
    </el-drawer>  
</template>
```



#### 抽屉逻辑

```javascript
<script setup>
    import { ref } from 'vue';
    const showDrawer = ref(false) 
    
    // 定义 props 接收父组件
    const props = defineProps({
        title:String,             // 显示标题
        size:{                    // 窗口大小
            type:String,
            default:"35%"
        },                         
        destroyOnClose:{          // 关闭时是否销毁
            type:Boolean,
            default:"false"
        },
        closeOnClickModal:{        // 点击遮罩层是否关闭
            type:Boolean,
            default:"false"
        },
        confirmText:{              // 提交按钮文字
            type:String,
            default:"提交"            
        } 
    })
    
    // 定义 loading 当前状态及方法
    const loading = ref(false)
    const showLoading = ()=>loading.value = true
    const hideLoading = ()=>loading.value = false
    
    // 定义打开抽屉方法
    const open= ()=> showDrawer.value=true
    
    // 定义关闭抽屉方法
    const close= ()=>showDrawer.value=false

    // 提交按钮事件，接收父组件发送事件
    const emit = defineEmits(["submit"])  
    const submit = ()=> emit("submit")

    // 向父组件暴露以下方法
    defineExpose({
        open,
        close,
        showLoading,
        hideLoading
    })
</script>
```



#### 抽屉修饰

```css

<style>
    .formDrawer{
        width: 100%;
        height: 100%;
        position:relative;
        @apply flex flex-col; 
    }
    .formDrawer .body{
        flex:1;
        position:absolute;
        top:0;
        left:0;
        right:0;
        bottom: 50px;
        overflow-y:auto;
    }
    .formDrawer .actions{
        height: 50px;
        @apply mt-auto flex items-center;
    }
</style>
```



#### 简化代码

```javascript
// \src\composables\useManager.js
import { ref, reactive } from 'vue'
import { logout, updatepassword } from "~/api/manager"
import { showModal, toast } from "~/composables/util"
import { useRouter } from "vue-router"
import { useStore } from "vuex"

//用户变更密码函数
export function useRepassword() {
    const router = useRouter()
    const store = useStore()
    // 定义子组件接收变量
    const formDrawerRef = ref(null)
    const form = reactive({
        oldpassword: "",
        password: "",
        repassword: ""
    })

    // 定义验证规则 
    const rules = {
        oldpassword: [
            {
                required: true,                 // 必填项
                message: '旧密码不能为空',       // 提示
                trigger: 'blur'                 // 规则触发条件
            },
        ],
        password: [
            {
                required: true,                    // 必填项
                message: '新密码不能为空',            // 提示
                trigger: 'blur'                    // 规则触发条件
            },
        ],
        repassword: [
            {
                required: true,                    // 必填项
                message: '确认密码不能为空',            // 提示
                trigger: 'blur'                    // 规则触发条件
            },
        ]
    }

    const formRef = ref(null)                       // 用于点击登录按钮时验证规则

    // 定义提交按钮事件
    const onSubmit = () => {
        formRef.value.validate((valid, fields) => {
            if (!valid) {
                return false
            }
            formDrawerRef.value.showLoading()                    // 加载时 loading
            updatepassword(form)
                .then(res => {
                    toast("修改密码成功，请重新登录")
                    store.dispatch("logout")
                    router.push("/login")
                })
                .finally(() => {
                    formDrawerRef.value.hideLoading()
                })
        })
    }
    const openRepasswordForm = () => formDrawerRef.value.open()

    return {
        formDrawerRef,
        form,
        rules,
        formRef,
        onSubmit,
        openRepasswordForm
    }
}

// 定义用户登出
export function useLogout() {
    const router = useRouter()
    const store = useStore()
    // 退出登录按钮事件 
    function handleLogout() {
        showModal("是否要退出登录").then((res) => {
            logout().finally(() => {
                // 清除用户状态及 cookie
                store.dispatch("logout")
                // 跳转回登录页
                router.push("/login")
                // 提示退出登录成功
                toast("退出登录成功")
            })
        }).catch()
    }
    return {
        handleLogout
    }
}
```

* **简化头文件代码**

```javascript
// \src\layouts\components\FHeader.vue

<script setup>
    import { useFullscreen } from '@vueuse/core'   // 引入全屏组件 vueuse
    import FormDrawer from "~/components/FormDrawer.vue"  // 引入抽屉组件
    import { useRepassword, useLogout } from "~/composables/useManager"  // 引入退出登录和修改密码的函数
    const { isFullscreen, toggle } = useFullscreen()  // 定义全屏执行事件
    const {
        formDrawerRef,
        form,
        rules,
        formRef,
        onSubmit,
        openRepasswordForm
    } = useRepassword()

    const {
        handleLogout
    } = useLogout()

    // 监听下拉菜单事件
    const handleCommand =(c)=>{
        switch (c) {
            case "logout":
                handleLogout()
                break;
            case "rePassword":
                openRepasswordForm()
                break;
        }
    }

    // 刷新按钮事件
    const handleRefresh=()=> location.reload()
</script>
```





### 4. 侧边栏

#### 主结构

```vue
<template>
    <div class="f-menu">
        <!-- 定义侧边栏 -->
        <el-menu default-active="2" class="border-0" @select="handleSelect">
            <!-- 遍历侧边栏菜单 -->
            <template v-for ="(item,index) in asideMenus" :key="index">       
                <!-- 1. 如有子菜单，执行此代码 -->
                <el-sub-menu v-if="item.child && item.child.length > 0" :index="item.name">
                    <!-- 1.1 定义菜单图标、标题 -->
                    <template #title>
                        <el-icon>
                            <component :is="item.icon"></component>     
                        </el-icon>
                        <span>
                            {{item.name}}
                        </span>
                    </template>
                    <!-- 1.2 遍历子菜单 child 项，生成 child 图标、标题 -->
                    <el-menu-item v-for="(item2,index2) in item.child" :key="index2" :index="item2.frontpath">
                        <el-icon>
                            <component :is="item2.icon"></component>
                        </el-icon>
                        <span>
                            {{item2.name}}
                        </span>
                    </el-menu-item>
                </el-sub-menu>
                
                <!-- 2.如不存在子菜单，执行此代码，不进行 child 遍历操作 -->
                <el-menu-item v-else :index="item.frontpath" >
                    <!-- 2.1 定义菜单图标、标题 -->
                    <el-icon>
                        <component :is="item.icon"></component>
                    </el-icon>
                    <span>
                        {{item.name}}
                    </span>
                </el-menu-item>
            </template>
      </el-menu>
    </div>
</template>
<script setup>
    import { useRouter } from 'vue-router'
    
    const router = useRouter() 
    // 定义菜单数组
    const asideMenus = [
        {
            name: "后台面板",
            icon: "help",
            path: '/dashboard',
            child: [
                {
                    name: "主控台",
                    icon: "home-filled",
                    frontpath: '/',
                }
            ],
        }, 
        {
            name: "商城管理",
            icon: "shopping-bag",
            path: '/dashboard',
            child: [
                {
                    name: "商品管理",
                    icon: "shopping-cart-full",
                    frontpath: '/goods/list',
                }
            ],
        } 
    ]

    // 监听侧边栏点击事件
    const handleSelect = (e)=>{
        router.push(e)
    }
</script>
<style scoped>
    /***************************************************************************
    *   侧边栏设置
    *   1. 设置宽度为 250px
    *   2. 设置距头部 64px
    *   3. 设置距底部 0px
    *   4. 设置距左部 0px
    *   5. 设置是否滚动 overflow:auto
    *   6. windi css 设置阴影 固定 背景 @apply shadow-md fixed bg-light-50
    ****************************************************************************/
    .f-menu{
        width: 250px;
        top: 64px;
        bottom: 0;
        left: 0;
        overflow:auto;
        @apply shadow-md fixed bg-light-50;
    }
</style>
```



#### 创建页面文件

* 创建文件夹 (商城管理)

  ```shell
  # md  ~/src/goods/
  ```

* 创建文件 (商品管理)

  ```shell
  # copy con ~/src/goods/list.vue
  ```



#### 添加路由地址

```javascript
// src/router/index.js
import GoodList from "~/pages/goods/list.vue"
const routes = [
    {
        path: "/",
        component: Admin,
        // 子路由
        children: [{
            path: "/",
            component: Index,
            meta: { title: "后台首页" }
        },
        {
            path: "/goods/list",
            component: GoodList,
            meta: { title: "商品管理" }
        },
        ]

    }, {
        path: "/login", component: Login, meta: { title: "登录页" }
    }, {
        path: '/:pathMatch(.*)*', name: 'NotFound', component: NotFound
    }
]
```



#### 侧边栏隐藏

* 修改 vuex 添加侧边栏宽

  ```javascript 
  // ~/src/store/index.js
  state() {
          return {
              // 侧边宽度保存
              asideWidth: "250px"
          }
      },
  
  mutations: {
          /*******************************************************
           *  handleAsideWidth(state){}
           *  作用：展开/缩起侧边栏 
           *  操作：弹性修改侧边栏宽   
           * ****************************************************/
          handleAsideWidth(state) {
              state.asideWidth = state.asideWidth == "250px" ? "64px" : "250px"
          }
      },
  ```

* 修改头部文件

  ```vue
  ~/src/layouts/components/FHeader.vue
  <template>
  	<el-icon class="icon-btn" @click="$store.commit('handleAsideWidth')">
          <Fold v-if="$store.state.asideWidth == '250px'"/>
          <Expand v-else/>
      </el-icon>
  </template>
  ```

* 修改侧边栏代码

  ```vue
  // ~/src/layouts/components/FMenu.vue
  <template>
  	<el-menu unique-opened :collapse="isCollapse" :collapse-transition="false">
  </template>
  <script setup>
      import { useStore } from 'vuex';
      const store = useStore()
      // 是否折叠属性
      const isCollapse = computed(() =>!(store.state.asideWidth == '250px') )
  </script>
  <style scoped>
      .f-menu{
          transition:all 0.2s;
          width: 250px;
          top: 64px;
          bottom: 0;
          left: 0;
          overflow-y:auto;
          overflow-x: hidden;
          @apply shadow-md fixed bg-light-50;
      }
  </style>
  ```

* 修改整体结构

  ```vue
  // ~/src/layouts/admin.vue
  <template>
  	<el-container>
          <el-aside :width="$store.state.asideWidth">       // 隐藏式整体结构缩进
              <f-menu></f-menu>
          </el-aside>
  </template>
  ```

  



### 5. 侧边栏动态菜单

#### 选中和路由关联

* **目标：**路由地址变化时，侧边根据新路由地址，菜单自动激活对应项
* **语法：** **default-active**	页面加载时默认激活菜单的 index	string	—	—
* **代码：**

```vue
// ~/src/layouts/components/FMenu.vue
<template>
	<el-menu :default-active="defaultActive">
</template>
<script setup>
    import { useRoute } from 'vue-router'
    // 菜单选中和路由关联
    const defaultActive = ref(route.path)
</script>    
```



#### 前后端交互菜单

* **菜单公共存储建立**

  ```javascript
  // ~/src/store/index.js
  state() {
      return {
          // 侧边栏菜单保存
          menus: [],
  
          // 权限列表保存
          ruleNames: []
      }
  },
  
  mutations: {
      /*******************************************************
       *  SET_MENUS(state,menus){}
       *  作用：设置侧边栏菜单 
       *  操作：将 api 请求数据存入 state.menus   
       * ****************************************************/
      SET_MENUS(state,menus){
          state.menus = menus
      },
  
      /*******************************************************
       *  SET_RULENAMES(state,ruleNames){}
       *  作用：设置用户权限 
       *  操作：将 api 请求数据存入 state.ruleNames   
       * ****************************************************/
      SET_RULENAMES(state,ruleNames){
          state.menus = menus
      },
  },
  
  actions: {
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
                  commit("SET_MENUS", res.menus)                 // 设置侧边栏菜单
                  commit("SET_RULENAMES", res.ruleNames)         // 设置用户权限规则
                  resolve(res)
              }).catch(err => reject(err))
          })
      },
  },    
  ```

* 修改侧边栏执行

  ```javascript
  // ~\src\layouts\components\FMenu.vue
  <script setup>
      //侧边栏数据加载
  	const asideMenus = computed(()=>store.state.menus)
  </script>
  ```

* 侧边栏滚动条隐藏

  ```javascript
  // ~\src\layouts\components\FMenu.vue
  /***************************************************************************
  *   1. 隐藏侧边栏滚动条   width: 0px
  ****************************************************************************/
  .f-menu::-webkit-scrollbar{ 
      width: 0px;
  }
  ```



#### 菜单路由动态添加

* **目标：**根据动态菜单，自动生成路由

* 将路由分成：

  * 默认路由：固定不变
  * 动态路由：根据用户自动生成

  ```javascript
  // ~/src/router/index.js
  // 默认路由，所有用户共享
  const routes = [{
      path: "/",
      name: "admin",
      component: Admin,
  }, {
      path: "/login",
      component: Login,
      meta: { title: "登录页" }
  }, {
      path: '/:pathMatch(.*)*',
      name: 'NotFound',
      component: NotFound
  }]
  
  // 动态路由，用于匹配菜单动态添加路由
  const asyncRoutes = [{
      path: "/",
      name: "/",
      component: Index,
      meta: { title: "后台首页" }
  }, {
      path: "/goods/list",
      name: "/goods/list",
      component: GoodList,
      meta: { title: "商品管理" }
  }, {
      path: "/category/list",
      name: "/category/list",
      component: CategoryList,
      meta: { title: "分类列表" }
  }]
  ```

  



### 6. 标签导航栏

**目标：**

* 右侧下拉菜单，能关闭当前 Tab ，能关闭所有 Tab 标签 
* 实现和路由、存储联动，导航栏生成 Tab
  1. 刷新页面，默认选中当前路径
* 

#### 导航栏样式

```vue
// layouts/components/FTagList.vue
<template>
    <div class="f-tag-list" :style="{left:$store.state.asideWidth}">
        <!-- 左侧标签容器 -->
        <el-tabs v-model="activeTab" type="card" class="flex-1" closable @tab-remove="removeTab" style="min-width: 100px;">
            <el-tab-pane v-for="item in tabList" :key="item.path" :label="item.title" :name="item.path"></el-tab-pane>
        </el-tabs>
        <!-- 右侧下拉按钮容器 -->
        <span class="tag-btn">
            <el-dropdown>
                <span class="el-dropdown-link">
                    <el-icon> <arrow-down /></el-icon> 
                </span>
                <template #dropdown>
                <el-dropdown-menu>
                    <el-dropdown-item>Action 1</el-dropdown-item>
                    <el-dropdown-item>Action 2</el-dropdown-item>
                    <el-dropdown-item>Action 3</el-dropdown-item>
                    <el-dropdown-item disabled>Action 4</el-dropdown-item>
                    <el-dropdown-item divided>Action 5</el-dropdown-item>
                </el-dropdown-menu>
                </template>
            </el-dropdown>
        </span>
    </div>
</template>
<script setup>
    import { ref } from 'vue'
    const activeTab = ref('2')       // 当前激活标签
    const tabList = ref([            // 定义标签对象
    {
        title: '后台首页',
        path:"/"
    },
    {
        title: '商城管理',
        path:"/goods/list"
    },
    ])
</script>
<style scoped>
    .f-tag-list{
        @apply fixed bg-gray-100 flex items-center;
        top: 64px;
        right: 0;
        height: 44px;
        z-index:100;     /* 指定元素层级 */
    }
    .tag-btn{
        @apply bg-white rounded ml-auto flex items-center justify-center px-2;
        height: 32px;
        width: 32px;
    }
    :deep(.el-tabs__header){                               /* 此语句用于设置，封装组件样式 */   
        @apply flex items-center justify-start mb-0;
    }
    :deep(.el-tabs__nav){
        border: 0!important;
    }
    :deep(.el-tabs__item){
        border:0!important;
        height: 32px;
        line-height: 33px;                                  /* 默认行高比较矮，更改默认行距   */
        @apply bg-white mx-1 rounded;
    }
    :deep(.el-tabs__nav-next),:deep( .el-tabs__nav-prev){
        line-height: 33px;                                  /* 更改默认行高，滚动条能剧中 */
        height: 33px;
    } 
    :deep(.is-disabled){                                    /* 滚动条鼠标样式，滚动到头时成不可选 */
        cursor: not-allowed;
        @apply text-gray-300;
    }
</style>
```





#### 标签栏路径和存储



* **刷新显示当前页面**

```vue
<template>
	<el-tabs v-model="activeTab" type="card" class="flex-1" @tab-remove="removeTab" style="min-width: 100px;" closable >
        <el-tab-pane v-for="item in tabList" :key="item.path" :label="item.title" :name="item.path" >
        </el-tab-pane>
	</el-tabs>
</template>
<script setup>
	import {useRoute} from 'vue-router'
    const route=useRoute()
    const activeTab = ref(route.path)
</script>
```



* **后台首页关闭取消**

```vue
<template>
    <el-tabs v-model="activeTab" type="card" class="flex-1" @tab-remove="removeTab" style="min-width: 100px;">
        <el-tab-pane :closable="item.path != '/' "  v-for="item in tabList" :key="item.path" :label="item.title" :name="item.path">
        <!--  :closable="item.path != '/' "        路径不为 "/" 允许访问   -->
        </el-tab-pane>
    </el-tabs>
</template>
```



* **增加新标签**

  1. 添加标签导航函数

     ```vue
     <script>
     	import { useCookies } from '@vueuse/integrations/useCookies'
         function addTab(tab){
             let noTab = tabList.value.findIndex(t=>t.path == tab.path) == -1
             if(noTab){
                 tabList.value.push(tab)
             }
             cookie.set("tabList",tabList.value)
         }
     </script>
     ```

     

     

  2. 监听路由更新

     ```vue
     <script>
     	// 监听路由更新                       
         onBeforeRouteUpdate((to,from)=>{
             activeTab.value = to.path
             addTab({
                 title:to.meta.title,
                 path:to.path
             })
         }) 
     </script>
     

  3. 点击标签路由变更

     

     ```vue
     <script>
         import {useRoute,onBeforeRouteUpdate,useRouter} from 'vue-router';
     	// 点击标签路由变更
         function changeTab(t){
             activeTab.value = t
             router.push(t) 
         }  
     </script>
     ```

     ​	

  4. 初始化标签导航列表

     ```vue
     <script>
     	// 初始化标签导航列表
         function initTabList(){
             let tbs = cookie.get("tabList")
             console.log(tbs);
             if(tbs){
                 tabList.value = tbs
             }
         }
         initTabList()
     </script>
     ```

  

* **关闭标签按钮**

  ```vue
  <script>  
  	// 关闭标签按钮
      const removeTab = (t) => {
          let tabs = tabList.value
          let a = activeTab.value
          if(a==t){
              tabs.forEach((tab,index) => {
                  if(tab.path == t){
                      const nextTab = tabs[index+1] || tabs[index-1]
                      if(nextTab){
                          a = nextTab.path
                      }
                  }
              });
          }
          activeTab.value = a
          tabList.value = tabList.value.filter(tab =>tab.path != t)
          cookie.set("tabList",tabList.value)
      }
  </script>  

​	

* **关闭其他 / 全部关闭**

  ```vue
  <template>
      <span class="tag-btn">                                         
          <el-dropdown  @command="handleClose">									<!-- command="监听事件名称" -->
              <span class="el-dropdown-link">
                  <el-icon> <arrow-down /></el-icon> 
              </span>
              <template #dropdown>
                  <el-dropdown-menu>
                      <el-dropdown-item command="clearOther">关闭其他</el-dropdown-item>      <!--  command = "事件名"  -->
                      <el-dropdown-item command="clearAll">全部关闭</el-dropdown-item>
                  </el-dropdown-menu>
              </template>
          </el-dropdown>
      </span>
  </template>
  <script>
  	// 关闭其他/全部关闭
      const handleClose = (c) => {
          if(c=="clearAll"){
              //  切换回首页
              activeTab.value = "/"
              // 过滤只剩下首页
              tabList.value = [{title: '后台首页',path:"/"}]
          }else if(c=="clearOther"){
              // 过滤只剩下首页和当前激活
              tabList.value = tabList.value.filter(tab =>tab.path == "/" || tab.path == activeTab.value)
          };
          cookie.set("tabList",tabList.value)
      }
  </script>

​	

* **简化代码及封装**

1. 在地址 **~/src/composables** 创建文件  **useTabList.js** 

2. 复制优化新生代码

   ```javascript
   // ~/src/composables/useTabList.js 
   import { ref } from 'vue'
   import { useRoute, onBeforeRouteUpdate, useRouter } from 'vue-router';
   import { useCookies } from '@vueuse/integrations/useCookies'
   import { router } from '~/router'
   export function useTabList() {              // 将复制代码共享
       // 复制源文件代码 ...
       return {
           activeTab,
           tabList,
           changeTab,
           removeTab,
           handleClose,
       }
   }

3. 修改原文件

   ```vue
   // ~src/components 
   <script>
   	import { useTabList } from "~/composables/useTabList.js"
   	const { 
           activeTab,
           tabList,
           changeTab,
           removeTab,
           handleClose,
       } = useTabList()
   </script>



#### 优化及全局动画

1. 菜单点击优化

   ```javascript
   // /src/permission.js
   // 全局前置守卫
   let hasGetInfo = false;
   if (token && !hasGetInfo) {
       let { menus } = await store.dispatch("getinfo");
       hasGetInfo = true;
       // 动态添加路由
       hasNewRoutes = addRoutes(menus);
   }
   

2. keep-alive

   ```javascript
   // /src/layouts/admin.vue
   <router-view v-slot="{Component}"> 
   	<keep-alive :max="10">
           <component :is="Component"></component>
        </keep-alive>
    </router-view>

3. 全局动画效果

   ```javascript
   // /src/layouts/admin.vue
   <router-view v-slot="{Component}"> 
       <transition name="fade">
           <keep-alive :max="10">
               <component :is="Component"></component>
           </keep-alive>
       </transition>
   </router-view>
   
   .fade-enter-from{          /* 进入之前执行动画   */
       opacity: 0;
   }
   .fade-enter-to{           /* 进入之后执行动画   */
       opacity: 1;
   }
    .fade-leave-from{        /* 离开之前执行动画  */
       opacity: 1;
   }
    
   .fade-leave-to{           /* 离开之后执行动画  */
       opacity: 0;
   }
   .fade-enter-active,         /* 进入离开动画时长 */
   .fade-leave-active{
       transition: all 0.3s;
   }
   .fade-enter-active{
       transition-delay: 0.3s;
   }
   ```

   



## 主控台布局



### 1. 统计面板布局



#### **创建接口文件**

```javascript
// /src/api/index.js
import axios from '~/axios'
// 后台首页统计1
export function getStatistics1() {
    return axios.get("/admin/statistics1")
}
```

#### **后台首页统计1布局**

```javascript
// script 
import { ref } from "vue";
import { getStatistics1 } from "~/api/index.js"
getStatistics1()
.then(res => {
    panels.value = res.panels
    console.log(panels.value);
})
```

```html
<!-- template-->
<div>
    <!-- 后台首页统计1 -->
    <div class="statistics1" style="display:flex; justify-content: space-around; gap: 33px;" >
        <div style="flex:1" v-for="(item,index) in panels" :key="index">
            <el-card shadow="hover" class="border-0">
                <!-- 页眉 -->
                <template #header>
                    <div class="flex justify-between">
                        <span class="text-sm">{{ item.title }}</span>
                        <el-tag :type="item.unitColor" effect="plain"> {{ item.unit }} </el-tag>
                    </div>
                </template>
                <!-- 正文 -->
                <span class="text-3xl font-bold text-gray-500"> {{ item.value }} </span>
                <el-divider />
                <!-- 页脚 -->
                <div class="flex justify-between text-sm text-gray-500 ">
                    <span>{{ item.subTitle }}</span>
                    <span>{{ item.subValue }}</span>
                </div>
            </el-card>
        </div>
    </div>
</div>

```

#### **骨架屏布局**

```html
<!-- 骨架屏 -->
<template v-if="panels.length == 0"> 
    <div style="flex:1" v-for="i in 4" :key="i">
        <el-skeleton style="width: 100%;" animated loading>
            <template #template>
                <el-card shadow="hover" class="border-0">
                    <!-- 页眉 -->
                    <template #header>
                        <div class="flex justify-between">
                            <el-skeleton-item variant="text" style="width: 50%" />
                            <el-skeleton-item variant="text" style="width: 10%" />
                        </div>
                    </template>
                    <!-- 正文 -->
                    <el-skeleton-item variant="h3" style="width: 80%" />
                    <el-divider />
                    <!-- 页脚 -->
                    <div class="flex justify-between text-sm text-gray-500 ">
                        <el-skeleton-item variant="text" style="width: 50%" />
                        <el-skeleton-item variant="text" style="width: 10%" />
                    </div>
                </el-card>
            </template>
        </el-skeleton>
    </div>
</template>
```



#### **数字滚动动画**

*  **安装滚动插件**

  ```shell
  # npm i gsap

* **封装成组件** 

  ``````vue
  // /src/components/CountTo.vue
  <template>
      {{ d.num.toFixed(0) }}
  </template>
  <script setup>
      import { reactive,watch } from 'vue';
      import gsap from 'gsap'
      const props = defineProps({
          value:{
              type:Number,
              default:0
          }
      })
      const d = reactive({
          num:0
      })
      function AnimateToValue(){
          gsap.to(d,{
              duration:0.5,
              num:props.value,
          })
      }
      AnimateToValue()
      watch(()=>props.value,()=>AnimateToValue())  // 更改时自动执行动画
  </script>
  <style scoped>
  </style>

* **加载执行组件动画**

  ```vue
  <template>
   	<!-- 正文 -->
      <span class="text-3xl font-bold text-gray-500"> 
          <CountTo :value="item.value" />
      </span>
  </template>
  <script setup>
      import CountTo from "~/components/CountTo.vue"
  </script>
  ```





### 2. 分类组件布局

#### 分类组件布局

* 建立分类组件

  ```shell
  # md shop-admin/src/components/IndexNavs.vue
  ```

  

* 组件代码建立

  ```vue
  <template>
      <div style="display:flex; justify-content: space-around; gap: 33px; margin-top:30px;">
          <!-- 建立图标导航 -->
          <div style="flex: 1;" v-for="(item,index) in iconNavs" :key="index">
              <!-- 卡片 -->
              <el-card shadow="hover" @click="$router.push(item.path)">
                  <div class="flex flex-col items-center justify-center cursor-pointer">
                      <!-- 图标 -->
                      <el-icon :size="16" :class="item.color">
                          <component :is="item.icon" />
                      </el-icon>
                      <!-- 标题 -->
                      <span class="text-sm mt-2">
                          {{item.title}}
                      </span> 
                  </div>
              </el-card>
          </div>
      </div>
  </template>
  <script setup>
      const iconNavs = [{
          icon:"user",
          color:"text-light-blue-500",
          title:"用户",
          path:"/user/list"
      },{
          icon:"shopping-cart",
          color:"text-violet-500",
          title:"商品",
          path:"/goods/list"
      },{
          icon:"tickets",
          color:"text-fuchsia-500",
          title:"订单",
          path:"/order/list"
      },{
          icon:"chat-dot-square",
          color:"text-teal-500",
          title:"评价",
          path:"/comment/list"
      },{
          icon:"picture",
          color:"text-rose-500",
          title:"图库",
          path:"/image/list"
      },{
          icon:"bell",
          color:"text-green-500",
          title:"公告",
          path:"/notice/list"
      },{
          icon:"set-up",
          color:"text-gray-500",
          title:"配置",
          path:"/setting/base"
      },{
          icon:"files",
          color:"text-yellow-500",
          title:"优惠券",
          path:"/coupon/list"
      },]
  </script>
  <style scoped>
      
  </style>
  ```

  

#### 建立页面文件

* 页面文件结构

  ```css
  └── src
  	├── pages                    # (folder) 页面文件夹
      	├── category             # (folder) 分类文件夹   
  	         ├── list.vue        # (file)   分类管理文件  
      	├── comment              # (folder) 评价文件夹  
  	         ├── list.vue        # (file)   评价管理文件    
      	├── coupon               # (folder) 优惠券文件夹 
  	         ├── list.vue        # (file)   优惠券管理文件    
  	    ├── goods                # (folder) 商城管理文件夹
  	         ├── list.vue        # (file)   商品管理文件    
  	    ├── image                # (folder) 图库文件夹
  	         ├── list.vue        # (file)   图库管理文件    
      	├── notice               # (folder) 公告文件夹 
  	         ├── list.vue        # (file)   公告管理文件    
      	├── order                # (folder) 订单文件夹
  	         ├── list.vue        # (file)   订单管理文件    
      	├── setting              # (folder) 配置文件夹  
  	         ├── base.vue        # (file)   配置管理文件    
      	├── user                 # (folder) 用户文件夹
  	         ├── list.vue        # (file)   用户管理文件    
  	    ├── 404.vue              # (file)   404 页面
   	    ├── index.vue            # (file)   主页面
  	    ├── login.vue            # (file)   登录页面
  	├── 
  	└── app.vue                  # (file)   app 页面文件入口	    
  ```



#### 修改路由文件

* 路由文件结构

  ```javascript
  // 导入路由及页面组件
  import { createRouter, createWebHashHistory } from 'vue-router'
  import Admin from "~/layouts/admin.vue"
  import Index from '~/pages/index.vue'
  import Login from '~/pages/login.vue'
  import NotFound from "~/pages/404.vue"
  import GoodList from "~/pages/goods/list.vue"
  import CategoryList from "~/pages/category/list.vue"
  import UserList from "~/pages/user/list.vue"
  import OrderList from "~/pages/order/list.vue"
  import CommentList from "~/pages/comment/list.vue"
  import ImageList from "~/pages/image/list.vue"
  import NoticeList from "~/pages/notice/list.vue"
  import SettingBase from "~/pages/setting/base.vue"
  import CouponList from "~/pages/coupon/list.vue"
  
  // 默认路由，所有用户共享
  const routes = [{
      path: "/",
      name: "admin",
      component: Admin,
  }, {
      path: "/login",
      component: Login,
      meta: { title: "登录页" }
  }, {
      path: '/:pathMatch(.*)*',
      name: 'NotFound',
      component: NotFound
  }]
  
  // 动态路由，用于匹配菜单动态添加路由
  const asyncRoutes = [{
      path: "/",
      name: "/",
      component: Index,
      meta: { title: "后台首页" }
  }, {
      path: "/goods/list",
      name: "/goods/list",
      component: GoodList,
      meta: { title: "商品管理" }
  }, {
      path: "/category/list",
      name: "/category/list",
      component: CategoryList,
      meta: { title: "分类列表" }
  }, {
      path: "/user/list",
      name: "/user/list",
      component: UserList,
      meta: { title: "用户列表" }
  }, {
      path: "/order/list",
      name: "/order/list",
      component: OrderList,
      meta: { title: "订单列表" }
  }, {
      path: "/comment/list",
      name: "/comment/list",
      component: CommentList,
      meta: { title: "评价列表" }
  }, {
      path: "/image/list",
      name: "/image/list",
      component: ImageList,
      meta: { title: "图库列表" }
  }, {
      path: "/notice/list",
      name: "/notice/list",
      component: NoticeList,
      meta: { title: "公告列表" }
  }, {
      path: "/setting/base",
      name: "/setting/base",
      component: SettingBase,
      meta: { title: "配置" }
  }, {
      path: "/coupon/list",
      name: "/coupon/list",
      component: CouponList,
      meta: { title: "优惠券列表" }
  },]
  
  
  // 创建路由器实例
  export const router = createRouter({
      history: createWebHashHistory(),
      routes: routes
  })
  
  // 动态添加路由的方法    addRoutes(menu) -> findAndAddRoutesByMenus(arr)
  export function addRoutes(menus) {
      // 是否有新的路由
      let hasNewRoutes = false
  
      // 递归遍历路由方法
      const findAndAddRoutesByMenus = (arr) => {
          arr.forEach(e => {
              let item = asyncRoutes.find(o => o.path == e.frontpath)  // 找到菜单对应的路由
              if (item && !router.hasRoute(item.path)) {               // 路由不存在，则添加
                  router.addRoute("admin", item)                       // 动态添加路由      
                  hasNewRoutes = true                                  // 标记有新的路由
              }
              if (e.child && e.child.length > 0) {
                  findAndAddRoutesByMenus(e.child)
              }
          })
      }
  
      findAndAddRoutesByMenus(menus)
  
      console.log(899, router.getRoutes(), hasNewRoutes);
  
      return hasNewRoutes
  }
  ```





### 3. 图表组件布局



#### 创建接口方法

```javascript
// ~/src/api/index.js
import axios from '~/axios'
// 后台首页统计1
export function getStatistics1() {
    return axios.get("/admin/statistics1")
}
// 后台首页统计3  type: month近1个月、week近1周、hour近1天
export function getStatistics3(type) {
    return axios.get("/admin/statistics3?type=" + type)
}
```



#### 安装图表插件

```shell
# npm install echarts
```



#### 图表组件布局

* 创建图表组件

  ```css
  # 建立图表组件 ~/src/components/IndexChart.vue
  ```

* 图表组件布局

  ```vue
  <template>
      <el-card shadow="never" >
          <!-- 卡片头部数据 -->
          <template #header>
              <div class="flex justify-between">
                  <span class="text-sm">订单统计</span>
                  <div>
                      <!-- 三个日期选项 -->
                      <el-check-tag v-for="(item,index) in options" :key="index" :checked="current == item.value" style="margin-right:8px" @click="handleChoose(item.value)">
                          {{ item.text }} 
                      </el-check-tag>
                  </div>
              </div>
          </template>
          <!-- 图表数据容器 -->
          <div ref="el" id="chart" style="height: 300px;">
          </div>
      </el-card>
  </template>
  <script setup>
      import { ref,onMounted,onBeforeUnmount } from "vue";
      import * as echarts from 'echarts';
      import { getStatistics3 } from '~/api/index.js'
      
      import { useResizeObserver } from '@vueuse/core'
      const current = ref("week")
      const options = [{
          text:"近1个月",
          value:"month"
      },{
          text:"近1周",
          value:"week"
      },{
          text:"近1天",
          value:"hour"
      },]
  
      const handleChoose = (type) =>{
          current.value = type
          getData()
      }
  
      var myChart = null
      
      
      
      
      onMounted(()=>{
          var chartDom = document.getElementById('chart');
          myChart = echarts.init(chartDom);
          getData()
      })
      // 当页面关闭时销毁echarts实例 
      onBeforeUnmount(()=>{
          if(myChart){
              myChart.dispose()
          }
      })
  
      function getData(){
          let option = {
              xAxis: {
                  type: 'category',
                  data: []
              },
              yAxis: {
                  type: 'value'
              },
              series: [
                  {
                  data: [],
                  type: 'bar'
                  }
              ]
          };
          // 添加表格加载动画
          myChart.showLoading()
          getStatistics3(current.value).then( res=>{
              option.xAxis.data = res.x
              option.series[0].data = res.y
  
              myChart.setOption(option)
          }).finally(()=>{
              myChart.hideLoading()
          })
      }
  
      // 表格窗体大小变化时，自动绘制表格窗体
      const el=ref(null)
      useResizeObserver(el, (entries) => {
          myChart.resize()
      })
  
  </script>
  <style scoped>
  </style>
  ```

  

* 加载图表组件

  ```vue
  <template>
   <!-- 后台首页统计2 + 后台首页统计3 -->
      <div style="display:flex; justify-content: space-around; gap: 33px; margin-top:30px;">
          <!-- 图表组件布局 后台首页统计3 -->
          <div style="flex:1">
              <IndexChart />
          </div>
          <!-- 后台首页统计2 -->
          <div style="flex:1">
              <IndexChart />
          </div>
      </div>
  </template>
  <script setup>
      import IndexChart from "~/components/IndexChart.vue"
  </script>



* 图表组件优化

  1. 添加表格加载动画

     ```vue
     <script>
     myChart.showLoading()
         getStatistics3(current.value).then( res=>{
             option.xAxis.data = res.x
             option.series[0].data = res.y
     
             myChart.setOption(option)
         }).finally(()=>{
             myChart.hideLoading()
         })
     </script> 
     ```

  2. 当页面关闭自动销毁

     ```vue
     <script>
     	// 当页面关闭时销毁echarts实例 
         onBeforeUnmount(()=>{
             if(myChart){
                 myChart.dispose()
             }
         })
     </script>
     ```

     

  3. 表格窗体大小变化时，自动绘制表格窗体

     ```vue
     <script>
     	import { useResizeObserver } from '@vueuse/core'
         // 表格窗体大小变化时，自动绘制表格窗体
         const el=ref(null)
         useResizeObserver(el, (entries) => {
             myChart.resize()
         })
     </script>
     
     ```

     



### 4. 店铺及交易组件



#### 创建接口方法

```javascript
// ~/src/api/index.js
```



#### 店铺及交易组件布局

* 创建组件文件

  ```vue
  # ~/src/components/IndexCard.vue
  ```

  

* 组件文件布局
  ```vue
  <template>
      <el-card shadow="never">
          <!-- 卡片表头布局 -->
          <template #header>
              <div class="flex justify-between">
                  <!-- 表头左侧标题 -->
                  <span class="text-sm">{{ title }}</span>
                  <!-- 表头右侧信息 -->
                  <el-tag type="danger" effect="plain">
                      {{ tip }}
                  </el-tag>
              </div>
          </template>
          
          <!-- 卡片正文布局 -->
          <div style="display:flex; justify-content: space-around; gap: 33px; "> <!-- margin-top: ; -->
              <div style="flex:1" v-for="(item,index) in btns" :key="index"> <!--  -->
                  <el-card shadow="hover" class="border-0 bg-light-400" > 
                      <div class="flex flex-col items-center justify-center">
                          <span class="text-xl mb-2">
                              {{item.value}}
                          </span>
                          <span class="text-xs text-gray-500">{{item.label}}</span>
                      </div>
                  </el-card>
              </div>
          </div>
      </el-card>
  </template>
  <script setup>
      defineProps({
          title:String,
          tip:String,
          btns:Array,
  
      })
  </script>
  <style scoped>
      
  </style>
  ```



* 加载组件文件

  ```vue
  // ~/shop-admin/src/pages/index.vue
  <template>
  <!-- 后台首页统计2 -->
      <div style="flex:1">
          <IndexCard title="店铺及商品提示" tip="店铺及商品提示" :btns="goods" class="mb-3" />
          <IndexCard title="交易提示" tip="立即处理交易数据" :btns="order"/>
      </div>
  </template>
  <script setup>
      const goods = ref([])
      const order = ref([])
      getStatistics2()
      .then(res => {
          goods.value = res.goods
          order.value = res.order
      })
  </script>



### 5. 按钮级权限控制

#### 自定义指令

**指令名：**`v-permission`       // 用于权限控制

```html
<div style="flex:1">
    <IndexChart v-permission="['getStatistics3.GET']" />
</div>
```



#### 创建指令文件夹

```shell
# 创建文件夹 ~/src/directives
# 创建权限文件 ~/src/directives/permission.js
```



#### 权限文件配置

```javascript
import store from "~/store"
function hasPermission(value, el = false) {
    if (!Array.isArray(value)) {
        throw new Error(`需要配置权限，例如 v-permission="['getStatistics3,GET']"`)
    }
    const hasAuth = value.findIndex(v => store.state.ruleNames.includes(v)) != -1
    if (el && !hasAuth) {
        el.parentNode && el.parentNode.removeChild(el)
    }
    return hasAuth
}

export default {
    install(app) {
        app.directive("permission", {
            mounted(el, binding) {
                hasPermission(binding.value, el)
            },
        })
    }
}
```



#### 加载指令文件

```javascript
// ~/src/main.js
import permission from "~/directives/permission.js"
app.use(permission)
```



#### 使用自定义指令

```vue
<template>
	<div>
        <!-- 后台首页统计1 -->
        <div class="statistics1" style="display:flex; justify-content: space-around; gap: 33px;" v-permission="['getStatistics1,GET']">
        </div> 
    </div>
</template>
```



## 图库模块开发

### 1. 图库模块布局

#### 图库模块布局

```vue
// ~/src/pages/image/list.vue
<template>
    <el-container class="bg-white rounded" :style="{ height: (h + 'px')}">
        <!-- 头部 -->
            <el-header class="image-header">Header</el-header>
        <el-container>
            <!-- 侧边 -->
            <el-aside width="220px" class="image-aside">
                <!-- 侧边上 -->
                <div class="top">
                    <div v-for="i in 100" :key="i">{{ i }}</div>
                </div>

                <!-- 侧边下 -->
                <div class="bottom">
                    分页区域
                </div>
            </el-aside>
            <!-- 主体 -->
            <el-main class="image-main">
                <!-- 主体上 -->
                <div class="top">
                    <div v-for="i in 100" :key="i">{{ i }}</div>
                </div>

                <!-- 主体下 -->
                <div class="bottom">
                    分页区域
                </div>
            </el-main>
        </el-container>
    </el-container>
</template>
<script setup>
    const windowHeight = window.innerHeight || document.body.clientHeight    // 获取浏览器可视区域高度
    const h = windowHeight - 65 - 44 - 40
</script>
<style scoped>
    .image-header{
       border-bottom: 1px solid #eeeeee;
       @apply flex items-center;
    }

    .image-aside{
        border-right: 1px solid #eeeeee;
        position: relative;
    }

    .image-main{
        position: relative;
    }

    .image-aside .top,.image-main .top{
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 50px;
        overflow-y: auto;
    }

    .image-aside .bottom,.image-main .bottom{
        position: absolute;
        bottom: 0;
        height:50px;
        left:0;
        right:0;
        @apply flex items-center justify-center
    }
</style>
```



#### 全局滚动条修改

```vue
// ~/src/App.vue
<style >
    body{
    ::-webkit-scrollbar{
      width : 4px;
      height: 6px;
    }
    ::-webkit-scrollbar-corner{
      display: block;
    }

    ::-webkit-scrollbar-thumb{
      border-radius: 8px;
      background-color: rgba(0,0,0,0.3)
    }
    ::-webkit-scrollbar-thumb,
    ::-webkit-scrollbar-track{
      border-right-color: transparent;
      border-left-color: transparent;
      background-color: rgba(0,0,0,0.1);
    }
</style>

```



### 2. 封装成组件



#### 封装图库侧边组件

```vue
// ~/src/components/ImageAside.vue
<template>
    <!-- 侧边 -->
    <el-aside width="220px" class="image-aside">
        <!-- 侧边上 -->
        <div class="top">
            <div v-for="i in 100" :key="i">{{ i }}</div>
        </div>
        <!-- 侧边下 -->
        <div class="bottom">
            分页区域
        </div>
    </el-aside>
</template>
<script setup>
</script>
<style scoped>
    .image-aside{
        border-right: 1px solid #eeeeee;
        position: relative;
    }
    .image-aside .top{
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 50px;
        overflow-y: auto;
    }
    .image-aside .bottom{
        position: absolute;
        bottom: 0;
        height:50px;
        left:0;
        right:0;
        @apply flex items-center justify-center;
    }

</style>
```



#### 封装图库主体组件

```vue
// ~/src/components/ImageMain.vue
<template>
    <!-- 主体 -->
    <el-main class="image-main">
        <!-- 主体上 -->
        <div class="top">
            <div v-for="i in 100" :key="i">{{ i }}</div>
        </div>
        <!-- 主体下 -->
        <div class="bottom">
            分页区域
        </div>
    </el-main>
</template>
<script setup>
</script>
<style scoped>
    .image-main{
        position: relative;
    }
    .image-main .top{
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 50px;
        overflow-y: auto;
    }
    .image-main .bottom{
        position: absolute;
        bottom: 0;
        height:50px;
        left:0;
        right:0;
        @apply flex items-center justify-center;
    }
</style>
```



#### 侧边组件图库分类

* **创建分类组件**

  ```shell
  # 创建组件文件 ~/components/AsideList.vue
  ```

* **分类组件代码** 

  ```vue
  <template>
      <div class="aside-list" :class="{'active': active }">
          <span class="truncate"><slot/></span>
          <el-button class="ml-auto px-1" text type="primary" size="small" @click="$emit('edit')">
              <el-icon :szie="12"><Edit /></el-icon>
          </el-button> 
          <el-button class="px-1" text type="primary" size="small" @click="$emit('delete')">
              <el-icon :szie="12"><Close /></el-icon>
          </el-button> 
      </div>
  </template>
  <script setup>
      defineProps({
          active:{
              type:Boolean,
              default:false
          }
      })
  
      defineEmits(["edit","delete"])
  </script>
  <style scoped>
      .aside-list{
          border-bottom: 1px solid #f4f4f4;
          cursor: pointer;
          @apply flex items-center p-3 text-sm text-gray-600;
      }
      .aside-list:hover,.active{
          @apply bg-blue-50;
      }
  </style>

* **创建分类接口**

  `~\src\api\image_class.js`

  ```javascript
  // ~/api/image_class.js
  import axios from "~/axios"
  export function getImageClassList(page){
      return axios.get("http://ceshi13.dishait.cn/admin/image_class/"+ page)
  
  }
  ```

  

* **加载分类组件**

  ```vue
  // ~/components/ImageAside.vue
  <template>
      <!-- 侧边 -->
      <el-aside width="220px" class="image-aside" v-loading="loading">
          <!-- 侧边上 -->
          <div class="top">     <!--   -->
              <AsideList :active="activeId == item.id" v-for=" (item,index) in list" :key="index" >
                  {{ item.name }}
              </AsideList>
          </div>
          <!-- 侧边下 -->
          <div class="bottom">
              <!-- 分页栏 -->
              <el-pagination background layout="prev, next" :total="total" :current-page="currentPage" :page-size="limit" @current-change="getData" />
          </div>
      </el-aside>
  </template>
  <script setup>
      import { ref } from "vue";
      import {getImageClassList} from "~/api/image_class.js"
      import AsideList from './AsideList.vue';
      // 加载动画
      const loading = ref(false)
      const list = ref([])
      
      // 激活状态
      const activeId = ref(0)
      
      // 分页数据
      const currentPage = ref(1)   // 当前页码默认为1
      const total = ref(0)         // 总条数默认为 0
      const limit = ref(10)        // 每页条数默认为 10
  
      // 获取数据
      function getData(p=null){
          if(typeof p=="number"){       // p 为当前页改变时数字
              currentPage.value = p
          }
  
          loading.value = true
          getImageClassList(currentPage.value)
          .then(res =>{
  		   total.value = res.totalCount
              list.value = res.list
              let item = list.value[0]
              if(item){
                  activeId.value = item.id
              }
          })
          .finally(()=>{
              loading.value = false
          })
      }
      getData()
  </script>
  <style scoped>
      .image-aside{
          border-right: 1px solid #eeeeee;
          position: relative;
      }
      .image-aside .top{
          position: absolute;
          top: 0;
          right: 0;
          left: 0;
          bottom: 50px;
          overflow-y: auto;
      }
      .image-aside .bottom{
          position: absolute;
          bottom: 0;
          height:50px;
          left:0;
          right:0;
          @apply flex items-center justify-center;
      }
  
  </style>



### 3. 新增图库分类按钮

#### 抽屉

* 引入

  ```vue
  // src/components/ImageAside
  <template>
  <!-- 新增分类图片抽屉 -->
      <FormDrawer title="新增" ref="formDrawerRef" @submit="handleSubmit" label-width="73px" :inline="false">
          <el-form :model="form" ref="formRef" :rules="rules">
              <el-form-item label="分类名称" prop="name">
                  <el-input v-model="form.name" placeholder="请输入分类名称"></el-input>
              </el-form-item>
              <el-form-item label="      排序" prop="order">
                  <el-input-number v-model="form.order" :min="0" :max="1000"/>  
              </el-form-item>
          </el-form>
      </FormDrawer>
  </template>
  <script setup>
      import FormDrawer from "./FormDrawer.vue"
      // 抽屉组件
      const formDrawerRef = ref(null)
      // 打开抽屉
      const handleCreate = ()=> formDrawerRef.value.open()
      // 表单数据
      const form = reactive({
          name:"",
          order:50
      })
      // 表单规则
      const rules = {
          name: [{ 
              required: true, 
              message: '图库分类名称不能为空', 
              trigger: 'blur' 
          }],
      }
      // 表单实例
      const formRef = ref(null)
      // 提交表单
      const handleSubmit = ()=>{
          formRef.value.validate((valid)=>{
              if(!valid) return
              console.log("提交成功");
          })
      }
      // 暴露打开抽屉方法
      defineExpose({
          handleCreate
      })
  </script>
  
  ```

  



#### 按钮

* 添加

  ```vue
  ~/pages/image/list.vue
  <template>
      <!-- 头部 -->
      <el-header class="image-header">
          <!-- 新增分类图片按钮 -->
          <el-button type="primary" size="small" @click="handleOpenCreate">
              新增图片分类
          </el-button>  
      </el-header>
  </template>
  <script setup>
  	const ImageAsideRef = ref(null)
  	const handleOpenCreate = ()=>ImageAsideRef.value.handleCreate()
  </script>



#### 新增分类

* **创建接口**

  ```javascript
  // ~/api/image_class.js
  export function createImageClassList(data) {
      return axios.post("/admin/image_class",data) 
  }
  ```

* **执行接口**

  ```vue
  // ~/components/ImageAside.vue
  <template>
  </template>
  <script setup>
  	import {getImageClassList, createImageClassList} from "~/api/image_class.js"
  	import {toast} from "~/composables/util.js"
  	// 提交表单
      const handleSubmit = ()=>{
          formRef.value.validate((valid)=>{
              if(!valid) return
              console.log("提交成功");
              formDrawerRef.value.showLoading()
              createImageClassList(form)                  // 将表单数据发送接口
              .then(res=>{
                  toast("新增成功")
                  getData(1)                          // 刷新新增数据
                  formDrawerRef.value.close()         // 关闭抽屉窗口
              }) 
              .finally(()=>{
                  formDrawerRef.value.hideLoading()
              })
          })
      }
  



#### 修改分类

* **创建接口**

  ```javascript
  // ~/api/image_class.js
  export function updateImageClass(id, data) {
      return axios.post("/admin/image_class/" + id, data)
  }
  ```

* **执行接口**

  ```vue
  <template>
   <!-- 侧边上 -->
      <div class="top">     <!--   -->
          <AsideList :active="activeId == item.id" v-for=" (item,index) in list" :key="index" @edit="handleEdit(item)">
              {{ item.name }}
          </AsideList>
  </template> 
  <script setup>
      // 提交表单
      const handleSubmit = ()=>{
          formRef.value.validate((valid)=>{
              if(!valid) return
              console.log("提交成功");
              formDrawerRef.value.showLoading()
  
              // 如果数值大于 0 ，执行更新接口，否则就执行新增接口
              const fun = editId.value ? updateImageClass(editId.value,form) : createImageClass(form)                  
  
              fun.then(res=>{
                  toast(drawerTitle.value + "成功")
                  getData(editId.value ? currentPage : 1)                          // 刷新新增数据
                  formDrawerRef.value.close()         // 关闭抽屉窗口
              }) 
              .finally(()=>{
                  formDrawerRef.value.hideLoading()
              })
          })
      }
      
      // 新增分类
      const handleCreate = ()=> {
          editId.value = 0 
          form.name=""                        // 清空表单
          form.order=50
          formDrawerRef.value.open()          // 打开抽屉
      }
  
      // 编辑分类
      const handleEdit = (row)=>{
          editId.value = row.id
          form.name = row.name
          form.order = row.order
          formDrawerRef.value.open()                  // 打开抽屉修改数据
      }
  </script>
      



#### 删除分类

* **创建接口**

  ```javascript
  // ~/api/image_class.js
  // 图片分类数据删除
  export function deleteImageClass(id) {
      return axios.post(`/admin/image_class/${id}/delete`)
  }

* **执行接口**

  ```vue
  // ~\components\ImageAside.vue
  <template>
  	<div class="top">     <!--   -->
          <AsideList :active="activeId == item.id" v-for=" (item,index) in list" :key="index" @edit="handleEdit(item)" @delete="handleDelete(item.id)">
              {{ item.name }}
          </AsideList>
  </template>
  <script setup>
      import { getImageClassList, createImageClass, updateImageClass, deleteImageClass } from "~/api/image_class.js"
      // 删除分类
      const handleDelete = (id)=>{
          loading.value = true
          deleteImageClass(id)                        // 执行删除接口
          .then(res=>{
              toast("删除成功")
              getData()                               // 重新获取数据    
          })
          .finally(()=>{
              loading.value = false
          })
      }
  </script>
  ```

* **弹出提示**

  ```vue
  // ~/components/AsideList.vue
  <template>
  	<el-popconfirm title="是否要删除该分类?" confirm-button-text="确认" cancel-button-text="取消" @confirm="$emit('delete')" >
          <template #reference>
              <el-button class="px-1" text type="primary" size="small" >
                  <el-icon :szie="12"><Close /></el-icon>
              </el-button> 
          </template>
      </el-popconfirm>
  </template>
  <script setup>
      defineProps({
          active:{
              type:Boolean,
              default:false
          }
      })
      defineEmits(["edit","delete"])
  </script>





### 4. 图片分页管理

#### **创建接口**

```javascript
// ~/api/image.js
import axios from "~/axios"
export function getImageList(id, page = 1) {
    return axios.get(`/admin/image_class/${id}/image/${page}`)
}
```



#### **分页栏**

```vue
// ~/components/ImageMain.vue
<template>
    <!-- 主体 -->
    <el-main class="image-main" v-loading="loading">
        <!-- 主体下 -->
        <div class="bottom">
            <!-- 分页栏区域 -->
            <el-pagination 
            background 
            layout="prev,pager, next" 
            :total="total" 
            :current-page="currentPage" 
            :page-size="limit" 
            @current-change="getData" />
        </div>
    </el-main>
</template>
<script setup>
    import { ref } from "vue";
    import { getImageList } from "~/api/image.js";

    // 分页数据
    const currentPage = ref(1)   // 当前页码默认为1
    const total = ref(0)         // 总条数默认为 0
    const limit = ref(10)        // 每页条数默认为 10
    const list = ref([])
    const loading = ref(false)
    const image_class_id = ref(0)   // 图片分类id 
    
    // 获取数据
    function getData(p=null){
        if(typeof p=="number"){       // p 为当前页改变时数字
            currentPage.value = p
        }
        loading.value = true
        getImageList(image_class_id.value,currentPage.value)
        .then(res =>{
            console.log(res);
            
            total.value = res.totalCount      // 总条数 = api 返回总条数
            list.value = res.list             // 列表数据 = api 返回列表数据
        })
        .finally(()=>{
            loading.value = false
        })
    }
    // 更具分类 id 重新加载图片列表
    const LoadData = (id) =>{
        currentPage.value = 1
        image_class_id.value = id
        getData()
    }
    defineExpose({
        LoadData
    })
</script>
```



#### 图片列表组件











## 项目结构

### 架构概述

```css

└── src
	├── api                       # (folder) 接口请求文件夹
	├──	assets                    # (folder) 				      
	├──	components                # (folder) 组件文件夹   
	├──	composables               # (folder) 常用代码工具文件夹
	├──	directives                # (folder) 自定义指令文件夹  
	├── layouts                   # (folder) 后台主布局文件夹  
	├──	pages                     # (folder) 页面文件夹   
	├──	router                    # (folder) 路由文件夹   
	├── store                     #	(folder) Vuex 存储文件夹   
	|
	├── App.vue                   # (file) vue 文件主入口
	├── axios.vue                 # (file) api 请求文件入口
	├── main.js                   # (file) javascrip 主入口文件   
	└──	permission.js             # (file) 路由权限文件


```



### api

```css
# src/pages/Vue页面文件  ->  src/api/接口文件  ->  src/axios.js      
```

```css
└── src
	├── api                       # (folder) 接口请求文件夹
	    ├── manager.js            # (file)   用户管理接口
	    ├── image_class.js        # (file)   图库管理接口      
	    ├── index.js              # (file)   后台首页接口
	    ├──                       # (file)   
	└── axios.js                  # (file)   axios模块导入及请求拦截器 	
```



### assets

```css

```

```css
└── src
	├── assets                    # (folder) 接口请求文件夹   
	    ├──                       # (file) 用户管理接口
	    ├── 
	    ├── 
	└──                           # (file) axios 请求文件入口	
```



### components

```css
# src/components/ 
```

```css
└── src
	├── components                # (folder) 自定义组件文件夹       
	    ├── CountTo.vue           # (file)   动画显示数字组件           
	    ├── FormDrawer.vue	      # (file)   侧边抽屉组件
	    ├── ImageAside.vue	      # (file)   
	    ├── AsideList.vue	      # (file)
	    ├── ImageMain.vue	      # (file)
	    ├── IndexCard.vue	      # (file)
	    ├── IndexChart.vue	      # (file)
	    ├── IndexNavs.vue	      # (file)
	└──                           	
```



### composables

```css
src/composables  -> 
```

```css
└── src
	├── composables               # (folder) 路由定义文件夹
	    ├── auth.js               # (file)   路由定义文件      
	    ├── util.js               # (file)   路由定义文件
	    ├── useManager.js         # (file)   用户管理工具 (useRepassword、useLogout)   
	    ├── useTabList.js         # (file)   标签管理工具   
	└── 	    
```



### directives

```css
# src/main   ->  src/directives/permission  
```

```css
└── src
	├── directives                # (folder) 自定义指令文件夹       
	    ├── permission.js         # (file) 权限控制指令文件             
	    ├── 
	    ├── 
	└──                     
```



### layouts

```css
router/index.js ->  layouts/admin.vue -> layouts/components/xxx.vue
```

```css
└── src
	├── layouts                  # (folder) 页面文件夹  
	    ├── components           # (folder) 布局组件文件夹                 
	        ├── FHeader.vue      # (file)   头布局组件        
 	        ├── FMenu.vue        # (file)   侧边布局组件    
	        ├── FTagList.vue     # (file)   标签导航布局组件       
	    └──	admin.vue            # (file)   主布局文件定义
	├── router                   # (folder) 路由文件夹 
	    ├── index.js             # (file)   路由定义文件
	
```



### pages

```css
# main.js   ->  app.vue  ->  <router-view>  -> src/pages/xxx.vue 文件   
```

```css
└── src
	├── pages                    # (folder) 页面文件夹
    	├── category             # (folder) 分类文件夹   
	         ├── list.vue        # (file)   分类管理文件  
    	├── comment              # (folder) 评价文件夹  
	         ├── list.vue        # (file)   评价管理文件    
    	├── coupon               # (folder) 优惠券文件夹 
	         ├── list.vue        # (file)   优惠券管理文件    
	    ├── goods                # (folder) 商城管理文件夹
	         ├── list.vue        # (file)   商品管理文件    
	    ├── image                # (folder) 图库文件夹
	         ├── list.vue        # (file)   图库管理文件    
    	├── notice               # (folder) 公告文件夹 
	         ├── list.vue        # (file)   公告管理文件    
    	├── order                # (folder) 订单文件夹
	         ├── list.vue        # (file)   订单管理文件    
    	├── setting              # (folder) 配置文件夹  
	         ├── base.vue        # (file)   配置管理文件    
    	├── user                 # (folder) 用户文件夹
	         ├── list.vue        # (file)   用户管理文件    
	    ├── 404.vue              # (file)   404 页面
 	    ├── index.vue            # (file)   主页面
	    ├── login.vue            # (file)   登录页面
	├── 
	└── app.vue                  # (file)   app 页面文件入口	    
```



### router

```css
# main.js   ->   src/permission.js   ->   src/router/index.js  
```

```css
└── src
	├── router                    # (folder) 路由定义文件夹
	    ├── index.js              # (file)   路由定义文件      
	    ├── 
	└── permission.js             # (file)   路由守卫权限文件	    
```



### store

```css
# main.js  ->  src/store/index.js 
```

```css
└── src
	├── store                     # (folder) 状态定义文件夹
	    ├── index.js              # (file)   定义入口文件      
	    ├── 
	└── pages                     # (folder) 页面文件夹执行存储  
```



## 课程资料

### 地址

| 名称     | 地址                                                         |
| -------- | ------------------------------------------------------------ |
| 云课堂   | https://study.163.com/course/courseMain.htm?courseId=1212775807&share=1&shareId=1483500481 |
| QQ群     | 530105610                                                    |
| API 文档 | http://dishaxy.dishait.cn/shopadminapi#7f8ce15f-7b6a-4d3d-ab72-1c45fee9bf92 |



