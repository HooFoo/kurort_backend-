import Vue from 'vue'
import * as VueGoogleMaps from 'vue2-google-maps'
import VueResource from 'vue-resource'
import VueI18n from 'vue-i18n'
import normalize from 'json-api-normalizer'
import humps from 'humps'

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
  let email = localStorage.getItem('email')
  let token = localStorage.getItem('token')
  if (email && token) {
    request.headers.set('X-User-Email', email)
    request.headers.set('X-User-Token', token)
  }
  if (request.body) {
    request.body = humps.decamelizeKeys(request.body)
  }
  next((response) => {
    if (request.url !== 'translations.json') {
      if (response.body !== null) {
        response.body = normalize(response.body)
      }
    }
  })
})

Vue.use(VueI18n)

/* global API_URL */
Vue.http.options.root = API_URL
Vue.http.options.xhr = { withCredentials: true }
Vue.http.options.emulateJSON = true

Vue.config.productionTip = false
