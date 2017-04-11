const LOGIN_URL = 'users/sign_in.json'
const LOGOUT_URL = 'users/sign_out.json'
const LOGOUT_METHOD = 'delete'
const REGISTER_URL = 'users.json'
const CURRENT_USER_URL = 'users/current.json'

let http, authData

class AuthService {
  constructor (httpService) {
    http = httpService
    authData = getAuthData()
    Object.defineProperty(this, 'authData', {
      get: () => authData
    })
  }

  login (credentials) {
    return new Promise((resolve, reject) => {
      http.post(LOGIN_URL, userRequestData(credentials)).then(response => {
        let user = response.body.data
        saveAuthData(user.attributes.email, user.attributes.authenticationToken)
        resolve(user)
      }, response => {
        reject(response.body.error)
      }).catch(error =>
        reject(error)
      )
    })
  }

  logout () {
    return new Promise((resolve) => {
      http[LOGOUT_METHOD](LOGOUT_URL, this.authData).then(response => {
        clearAuthData()
        resolve()
      })
    })
  }

  register (data) {
    return new Promise((resolve, reject) => {
      http.post(REGISTER_URL, userRequestData(data)).then(response => {
        let user = response.body.data
        saveAuthData(user.attributes.email, user.attributes.authenticationToken)
        resolve(user)
      }, response => {
        reject(response.body.errors)
      }).catch(response => reject(response))
    })
  }

  fetch (data) {
    return new Promise((resolve) => {
      http.get(CURRENT_USER_URL, this.authData).then(response => {
        if (response.body !== null) {
          resolve(response.body.data)
        }
      }).catch()
    })
  }
}

const userRequestData = function (credentials) {
  return {
    user: credentials
  }
}

const saveAuthData = function (email, token) {
  localStorage.setItem('email', email)
  localStorage.setItem('token', token)
  authData = { email, token }
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
  authData = null
}

export default AuthService
