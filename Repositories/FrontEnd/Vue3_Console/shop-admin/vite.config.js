import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import WindiCSS from 'vite-plugin-windicss'

import path from "path"  //引入路径模块，用于配置路径别名
export default defineConfig({
	resolve: {
		alias: {
			"~": path.resolve(__dirname, "src")     //将 src 目录添好名字"~"，让代码更简洁  
		}
	},
	plugins: [vue(), WindiCSS()],
})
