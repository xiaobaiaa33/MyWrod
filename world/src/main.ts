import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// 引入vue3.x新特性
import VueCompositionApi from '@vue/composition-api';
Vue.use(VueCompositionApi);
declare module '@vue/composition-api/dist/component/component' {
  interface SetupContext {
    readonly refs: { [key: string]: Vue | Element | Vue[] | Element[] };
  }
}

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
