import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import mkcert from "vite-plugin-mkcert"
import path from "path"
import WindiCSS from 'vite-plugin-windicss'
// https://vitejs.dev/config/
export default defineConfig({
  server: {
    // https: true,   // 需要开启https服务
    proxy: {
      '/api': {
        target: 'https://172.26.32.179:3000',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ''),
      },
    },
  },
  resolve: {
    alias: {
      "~": path.resolve(__dirname, "src")   // src路径 -> ~
    }
  },
  plugins: [vue(), WindiCSS(),]  // mkcert(), ,
})
