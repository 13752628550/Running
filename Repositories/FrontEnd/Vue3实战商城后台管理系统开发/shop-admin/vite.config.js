import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import WindiCSS from 'vite-plugin-windicss'
import path from "path"
// https://vitejs.dev/config/
export default defineConfig({
  resolve: {
    //定义别名路径
    alias: {
      "~": path.resolve(__dirname, "src")
    }
  },

  //跨域问题修复
  server: {
    proxy: {
      '/api': {
        target: `http://ceshi13.dishait.cn`,      // 此处写 api 接口地址
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, '')
      },
    }
  },

  plugins: [vue(), WindiCSS(),],
})
