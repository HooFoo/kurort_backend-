const LOGIN_URL = 'users/sign_in.json'
const LOGOUT_URL = 'users/sign_out.json'
const LOGOUT_METHOD = 'delete'
const REGISTER_URL = 'users.json'
const CURRENT_USER_URL = 'users/current.json'

let http

class AuthService {
  constructor (httpService) {
    http = httpService
  }

  login (credentials) {
    return new Promise((resolve, reject) => {
      http.post(LOGIN_URL, userRequestData(credentials)).then(response => {
        let user = response.body.data
        saveAuthData(user.attributes.email, user.attributes['authentication-token'])
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
      http[LOGOUT_METHOD](LOGOUT_URL, getAuthData()).then(response => {
        clearAuthData()
        resolve()
      })
    })
  }

  register (data) {
    return new Promise((resolve, reject) => {
      http.post(REGISTER_URL, userRequestData(data)).then(response => {
        let user = response.body.data
        saveAuthData(user.attributes.email, user.attributes['authentication-token'])
        resolve(user)
      }, response => {
        reject(response.body.errors)
      }).catch(response => reject(response))
    })
  }

  fetch (data) {
    return new Promise((resolve) => {
      let authData = getAuthData()
      if (!authData.email && !authData.token) {
        return
      }
      http.get(CURRENT_USER_URL, authData).then(response => {
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

export default AuthService
