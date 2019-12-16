import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

Vue.config.productionTip = false

// 引入Element-ui
import ElementUI, { Form } from "element-ui";
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

// 引入全局样式
import "@/assets/styles/global.scss";

// 引入axios
import axios from "@/api/axios"
import url from "@/api/getUrl"
// 定义全局变量类型
declare module 'vue/types/vue' {
  interface Vue{
    $axios:any,
    $url:any
  }
}
Vue.prototype.$axios = axios
Vue.prototype.$url = url

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
