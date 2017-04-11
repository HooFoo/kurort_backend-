import Vue from 'vue'
import * as VueGoogleMaps from 'vue2-google-maps'
import VueResource from 'vue-resource'
import VueAuth from './plugins/vue_auth'
import VueI18n from 'vue-i18n'
import camelize from 'camelize'

Vue.use(VueGoogleMaps, {
  load: {
    /* global GMAP_KEY */
    key: GMAP_KEY,
    v: '3.26',
    libraries: 'weather,geometry,visualization'
  }
})

Vue.use(VueResource)
Vue.http.interceptors.push((request, next) => {
  next((response) => { response.body = camelize(response.body) })
})

Vue.use(VueAuth)

/* global I18n */
Vue.use(VueI18n)
Vue.config.lang = 'ru'
Object.keys(I18n.translations).forEach(function (lang) {
  Vue.locale(lang, I18n.translations[lang])
})

/* global API_URL */
/* eslint no-undef: "error" */
Vue.http.options.root = API_URL
Vue.http.options.xhr = { withCredentials: true }
Vue.http.options.emulateJSON = true

Vue.config.productionTip = false
