import Vue from 'vue'
import langs from '@/resources/langs'
import i18n from '@/i18n'

export const login = ({ commit }, user) => {
  commit('login', user)
  if (user.attributes.lang) {
    i18n.locale = user.attributes.lang.key
    commit('setLanguage', user.attributes.lang)
  }
}

export const setLanguage = ({ state, commit, getters }, lang) => {
  i18n.locale = lang.key
  commit('setLanguage', lang)
  if (getters.authenticated && state.user.lang && state.user.lang.id !== lang.id) {
    commit('setUserLang', lang)
    Vue.http.put('users', { user: { lang: lang } })
  }
}

export const fetchLanguages = ({ commit, dispatch }) => {
  let langsList = []
  langs.get().then(response => {
    response.body.data.forEach(lang => {
      /* global API_URL */
      lang.attributes.icon = API_URL + lang.attributes.icon
      langsList.push({
        id: lang.id,
        ...lang.attributes
      })
    })
    commit('setLanguages', langsList)
    if (langsList.length > 0) {
      dispatch('setLanguage', langsList[0])
    }
  })
}
