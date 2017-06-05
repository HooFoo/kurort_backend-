import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/index'
import Profile from '@/components/profile'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      meta: { auth: false },
      name: 'Index',
      component: Index
    },
    {
      path: '/profile',
      meta: { auth: true },
      name: 'Profile',
      component: Profile
    }
  ]
})
