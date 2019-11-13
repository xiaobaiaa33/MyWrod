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
        component: ()=>import("@/views/home/Home.vue"),
      },
      {
        path: '/home/game/evolution',
        name: 'evolution',
        component: ()=>import("@/views/game/Evolution.vue"),
      },
      {
        path: '/home/game/engorge',
        name: 'engorge',
        component: ()=>import("@/views/game/Engorge.vue"),
      }
    ]
  },
]

const router = new VueRouter({
  routes
})

export default router
