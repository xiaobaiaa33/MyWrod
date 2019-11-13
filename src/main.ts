import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

Vue.config.productionTip = false

// 引入Element-ui
import ElementUI from "element-ui";
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

//引入全局样式
import "@/assets/styles/global.scss";

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
