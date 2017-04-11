import AuthService from '@/services/auth_service'

export default {
  install (Vue, options) {
    const service = new AuthService(Vue.http)

    Vue.http.interceptors.push(function (request, next) {
      let authData = service.authData
      if (authData) {
        request.headers.set('X-User-Email', authData.email)
        request.headers.set('X-User-Token', authData.token)
      }
      next()
    })

    Vue.auth = service
    Vue.prototype.$auth = service
  }
}
