import i18n from '@/i18n'
import _ from 'lodash'
import api from '@/api'

export const setCurrentUser = ({ commit, dispatch }, user) => {
  commit('login', user)
  localStorage.setItem('email', user.attributes.email)
  localStorage.setItem('token', user.attributes.authenticationToken)
  if (user.attributes.lang) {
    dispatch('setLanguage', user.attributes.lang.id)
  }
}

export const setLanguage = ({ state, commit, getters }, langId) => {
  commit('setLanguage', langId)
  i18n.locale = getters.currentLang.attributes.key
  localStorage.setItem('lang', langId)
  if (getters.authenticated && (!state.user.lang || state.user.lang.id !== langId)) {
    commit('setUserLang', getters.currentLang)
    api.saveUser(state.user)
  }
}

export const fetchLanguages = ({ commit, dispatch }) => {
  api.langs.get({ responseType: 'json' }).then(response => {
    commit('setLanguages', response.body.langs)
    if (!_.isEmpty(response.body.langs)) {
      let lang = _.first(_.keys(response.body.langs))
      let langKey = localStorage.getItem('lang')
      if (langKey) {
        lang = langKey
      }
      dispatch('setLanguage', lang)
    }
  })
}

export const login = function ({ dispatch }, credentials) {
  return api.login({ user: credentials })
    .then(users => {
      dispatch('setCurrentUser', _.first(_.values(users)))
    })
}

export const logout = function ({ dispatch }) {
  return api.logout().then(() => {
    dispatch('clearAuth')
  })
}

export const clearAuth = ({ commit }) => {
  commit('logout')
  localStorage.setItem('email', null)
  localStorage.setItem('token', null)
}

export const register = function ({ dispatch }, data) {
  return api.register({ user: data })
    .then(users => {
      dispatch('setCurrentUser', _.first(_.values(users)))
    })
}

export const checkAuth = function ({ dispatch, commit }) {
  commit('checkingAuth')
  return api.checkAuth().then(users => {
    dispatch('setCurrentUser', _.first(_.values(users)))
  }).catch(() => {
    dispatch('clearAuth')
  }).then(() => {
    commit('authChecked')
  })
}
