import { createApp } from 'vue'
import App from './App.vue'
import router from './routers'
import 'amfe-flexible/index.js'

createApp(App).use(router).mount('#app')
