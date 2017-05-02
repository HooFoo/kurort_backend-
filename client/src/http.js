import Vue from 'vue'
import _ from 'lodash'
import VueResource from 'vue-resource'
import normalize from 'json-api-normalizer'
import humps from 'humps'
import i18n from './i18n'

Vue.use(VueResource)
Vue.http.interceptors.push((request, next) => {
  let email = localStorage.getItem('email')
  let token = localStorage.getItem('token')
  if (email && token) {
    request.headers.set('X-User-Email', email)
    request.headers.set('X-User-Token', token)
  }
  request.headers.set('Accept-Language', i18n.locale)
  _.each(['params', 'body'], (key) => {
    request[key] = humps.decamelizeKeys(request[key])
  })
  next((response) => {
    if (request.url !== 'translations.json') {
      if (response.body !== null) {
        response.body = normalize(response.body)
      }
    }
  })
})
/* global API_URL */
Vue.http.options.root = API_URL
Vue.http.options.xhr = { withCredentials: true }
Vue.http.options.emulateJSON = true
