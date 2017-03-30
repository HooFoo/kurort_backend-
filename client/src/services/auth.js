const LOGIN_URL = 'users/sign_in.json'
const LOGOUT_URL = 'users/sign_out.json'
const LOGOUT_METHOD = 'delete'
const REGISTER_URL = 'users.json'

const userRequestData = function (credentials) {
  return {
    user: credentials
  }
}

const saveAuthData = function (email, token) {
  localStorage.setItem('user_email', email)
  localStorage.setItem('user_token', token)
}

const getAuthData = function getAuthData () {
  return {
    user_email: localStorage.getItem('user_email'),
    user_token: localStorage.getItem('user_token')
  }
}

const clearAuthData = function () {
  localStorage.removeItem('user_token')
  localStorage.removeItem('user_email')
}

export default {
  install (Vue, options) {
    options = options || {}

    const service = {
      login (credentials) {
        return new Promise(function (resolve, reject) {
          Vue.http.post(LOGIN_URL, userRequestData(credentials)).then(response => {
            let user = response.body
            saveAuthData(user.email, user.authentificate_token)
            resolve(user)
          }, response => {
            reject(response.body.error)
          }).catch(error =>
            reject(error)
          )
        })
      },
      logout () {
        return new Promise(function (resolve) {
          Vue.http[LOGOUT_METHOD](LOGOUT_URL, getAuthData()).then(response => {
            clearAuthData()
            resolve()
          })
        })
      },
      register (data) {
        return new Promise(function (resolve, reject) {
          Vue.http.post(REGISTER_URL, userRequestData(data)).then(response => {
            let user = response.body
            saveAuthData(user.email, user.authentification_token)
            resolve(user)
          }, response => {
            reject(response.body.errors)
          }).catch(response => reject(response))
        })
      },
      fetch (data) {
        return new Promise(function (resolve, reject) {
          Vue.http.post(LOGIN_URL, getAuthData()).then(response => {
            let user = response.body
            resolve(user)
          }, response => {
            reject(response.body)
          }).catch(error =>
            reject(error)
          )
        })
      }
    }
    Vue.auth = service
    Vue.prototype.$auth = service
  }
}
