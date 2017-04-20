import Vue from 'vue'

const LOGIN_URL = 'users/sign_in'
const LOGOUT_URL = 'users/sign_out'
const LOGOUT_METHOD = 'delete'
const REGISTER_URL = 'users'
const CURRENT_USER_URL = 'users/current'

export default {
  points: Vue.resource('points{/id}', {}, {
    my: { method: 'GET', url: 'points/my' },
    forRect: { method: 'POST', url: 'points/in' }
  }),

  langs: Vue.resource('langs{/id}'),

  login: function (data) {
    return Vue.http.post(LOGIN_URL, data)
      .then((response) => {
        return response.json()
      }, (response) => {
        throw response.body.error
      })
  },

  logout: function () {
    return Vue.http[LOGOUT_METHOD](LOGOUT_URL)
  },

  register: function (data) {
    return Vue.http.post(REGISTER_URL, data)
      .then((response) => {
        return response.json()
      })
      .catch((response) => {
        throw response.body.errors
      })
  },

  checkAuth: function () {
    return Vue.http.get(CURRENT_USER_URL)
      .then((response) => {
        return response.json()
      })
  },

  saveUser: (user) => {
    Vue.http.put('users', { user: user })
  }
}
