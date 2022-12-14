# 创建

## Vite 创建及安装

```js
# npm init vite@latest shop-admin -- --template vue
```



## 引入 ElementPlus 和基本组件

```js
# npm install element-plus --save
/* ****************************** main *********************************** 
 *	import ElementPlus from 'element-plus'
 *	import 'element-plus/dist/index.css'
 *	createApp(App).use(ElementPlus).mount('#app')
 * ***********************************************************************/ 
```



## 引入 Windicss 工具及配置安装代码提示

```js
# npm i -D vite-plugin-windicss windicss
/* ****************************** vite.config.js *********************************** 
 *	import WindiCSS from 'vite-plugin-windicss'
 *	plugins: [vue(), WindiCSS()],
 * *********************************************************************************/ 

/* ****************************** main ********************************************* 
 *	import 'virtual:windi.css
 * *********************************************************************************/ 
```



## 引入 vue-router

```js
# npm install vue-router@4
/* ***************** src/router/index.js ********************************* 
 *	import { createRouter, createWebHashHistory } from 'vue-router'
 *	const routes = []
 *	const router = createRouter({
 * 		history: createWebHashHistory(),
 *		routes
 *	})
 *	export default router
 * *************************************************************************/ 
	
/* ****************************** src/main ********************************* 
 *	import router from './router'
 *	app.use(router)
 * *************************************************************************/ 




```



# 登录页



# 接口文档地址

 http://dishaxy.dishait.cn/shopadminapi#7f8ce15f-7b6a-4d3d-ab72-1c45fee9bf92
