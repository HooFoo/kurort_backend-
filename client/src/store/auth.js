import Vue from 'vue'

export default {
  state: {
    user: null,
    loginErrorMsg: null,
    registerErrorMsg: null,
    authLoading: false
  },
  getters: {
    authenticated: state => state.user !== null
  },
  mutations: {
    login (state, payload) {
      state.user = {
        email: payload.email,
        id: payload.id
      }
    },
    setLoginError (state, error) {
      state.loginErrorMsg = error
    },
    setRegisterError (state, error) {
      state.registerErrorMsg = error
    },
    loading (state) {
      state.authLoading = true
    },
    cancelLoading (state) {
      state.authLoading = false
    },
    logout (state) {
      state.user = null
      state.user_email = null
      state.user_token = null
    }
  },
  actions: {
    login ({ commit }, credentials) {
      commit('loading')
      Vue.http.post('users/sign_in.json', credentials).then(response => {
        performAuth(commit, response)
        commit('setLoginError', null)
        commit('cancelLoading')
      }, response => {
        commit('setLoginError', response.body.msg)
        commit('cancelLoading')
      })
    },
    register ({ commit }, data) {
      commit('loading')
      Vue.http.post('users.json', data).then(response => {
        performAuth(commit, response)
        commit('setRegisterError', null)
        commit('cancelLoading')
      }, response => {
        commit('setRegisterError', response.body.msg)
        commit('cancelLoading')
      })
    },
    logout ({ state, commit }) {
      commit('loading')
      let email = state.email
      let token = state.token
      Vue.http.delete('users/sign_out.json', { user_email: email, user_token: token }).then(response => {
        clearAuthData()
        commit('logout')
        commit('cancelLoading')
      })
    },
    checkAuth ({ commit }) {
      Vue.http.post('users/sign_in.json', getAuthData()).then(response => {
        commit('login', {
          id: response.body.data.id,
          email: response.body.data.attributes.email,
          lang: response.body.data.relationships.lang.data
        })
      })
    }
  }
}

const saveAuthData = function saveAuthData (email, token) {
  localStorage.setItem('user_email', email)
  localStorage.setItem('user_token', token)
}

const getAuthData = function getAuthData () {
  return {
    user_email: localStorage.getItem('user_email'),
    user_token: localStorage.getItem('user_token')
  }
}

const clearAuthData = function clearAuthData () {
  localStorage.removeItem('user_token')
  localStorage.removeItem('user_email')
}

const performAuth = function performAuth (commit, response) {
  saveAuthData(response.body.data.attributes.email, response.body.data.attributes['authentication-token'])
  commit('login', {
    id: response.body.data.id,
    email: response.body.data.attributes.email,
    lang: response.body.data.relationships.lang.data
  })
}
