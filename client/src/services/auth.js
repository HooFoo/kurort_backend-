const LOGIN_URL = 'users/sign_in.json'
const LOGOUT_URL = 'users/sign_out.json'
const LOGOUT_METHOD = 'delete'
const REGISTER_URL = 'users.json'
const CURRENT_USER_URL = 'users/current.json'

const userRequestData = function (credentials) {
  return {
    user: credentials
  }
}

const saveAuthData = function (email, token) {
  localStorage.setItem('email', email)
  localStorage.setItem('token', token)
}

const getAuthData = function getAuthData () {
  return {
    email: localStorage.getItem('email'),
    token: localStorage.getItem('token')
  }
}

const clearAuthData = function () {
  localStorage.removeItem('token')
  localStorage.removeItem('email')
}

export default {
  install (Vue, options) {
    options = options || {}

    Vue.http.interceptors.push(function (request, next) {
      let authData = getAuthData()
      if (!authData.email && !authData.token) {
        next()
      } else {
        request.headers.set('X-User-Email', authData.email)
        request.headers.set('X-User-Token', authData.token)
        next()
      }
    })

    const service = {
      login (credentials) {
        return new Promise(function (resolve, reject) {
          Vue.http.post(LOGIN_URL, userRequestData(credentials)).then(response => {
            let user = response.body.data
            saveAuthData(user.attributes.email, user.attributes['authentication-token'])
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
            let user = response.body.data
            saveAuthData(user.attributes.email, user.attributes['authentication-token'])
            resolve(user)
          }, response => {
            reject(response.body.errors)
          }).catch(response => reject(response))
        })
      },
      fetch (data) {
        return new Promise(function (resolve) {
          let authData = getAuthData()
          if (!authData.email && !authData.token) {
            return
          }
          Vue.http.get(CURRENT_USER_URL, authData).then(response => {
            if (response.body !== null) {
              resolve(response.body.data)
            }
          }).catch()
        })
      }
    }
    Vue.auth = service
    Vue.prototype.$auth = service
  }
}
