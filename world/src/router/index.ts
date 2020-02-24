import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/views/login/Login.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {
      keepAlive: true,
      scrollTop: 0,
    },
  },
  {
    path: '/',
    redirect: "/login",
    name: 'layout',
    component: ()=>import("@/layout/Layout.vue"),
    children:[
      {
        path: '/home',
        name: 'home',
        meta:{ requireAuth: true }, //是否需要登陆权限
        component: ()=>import("@/views/home/Home.vue"),
      },
      // 游戏类
      {
        path: '/home/game/evolution',
        name: 'evolution',
        meta:{ requireAuth: true },
        component: ()=>import("@/views/game/Evolution.vue"),
      },
      {
        path: '/home/game/engorge',
        name: 'engorge',
        meta:{ requireAuth: true },
        component: ()=>import("@/views/game/Engorge.vue"),
      },
      // 日志
      {
        path: '/home/log',
        name: 'log',
        meta:{ requireAuth: true },
        component: ()=>import("@/views/log/Log.vue"),
      },
    ]
  },
]

const router = new VueRouter({
  routes
})

// 全局路由守卫
router.beforeEach((to, from, next) => {
  const user = sessionStorage.getItem("user")
  if (to.meta.requireAuth) { // 判断该路由是否需要登录权限
    if(user){ //判断本地是否存在access_token
      next();
    }else {
      next('/login')
    }
  }
  else {
    next();
  }
})

export default router
