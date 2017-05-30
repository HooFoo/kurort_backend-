// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'

import './config'
import './http'
window.jQuery = window.$ = require('jquery')
import 'materialize-css/dist/css/materialize.min.css'
import 'materialize-css/dist/js/materialize.js'
import './assets/stylesheets/app.scss'

import App from './app'
import router from './router'
import store from './store'
import i18n from './i18n'
import api from './api'

Vue.prototype.$api = api

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(position => {
    store.commit('setMapCenter', { lat: position.coords.latitude, lng: position.coords.longitude })
    store.commit('setUserPosition', { lat: position.coords.latitude, lng: position.coords.longitude })
  })
}

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  i18n,
  template: '<App/>',
  components: { App }
})
