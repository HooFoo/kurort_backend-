export default {
  setLanguage (state, lang) {
    state.langId = lang
  },

  setLanguages (state, langs) {
    state.langs = langs
  },

  setUserLang (state, lang) {
    let user = state.user
    user.lang = lang
    state.user = user
  },

  login (state, payload) {
    state.user = {
      ...payload.attributes,
      id: payload.id
    }
  },

  logout (state) {
    state.user = null
  },

  setMapCenter (state, center) {
    state.mapCenter.lat = center.lat
    state.mapCenter.lng = center.lng
  },

  setUserPosition (state, center) {
    state.userPosition.lat = center.lat
    state.userPosition.lng = center.lng
  }
}
