import AuthService from '@/services/auth_service'

export default {
  install (Vue, options) {
    const service = new AuthService(Vue.http)
    Vue.auth = service
    Vue.prototype.$auth = service
  }
}
