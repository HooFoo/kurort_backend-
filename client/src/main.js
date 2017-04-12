// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'

import './config.js'
window.jQuery = window.$ = require('jquery')
import 'materialize-css/dist/css/materialize.min.css'
import 'materialize-css/dist/js/materialize.min.js'
import './assets/stylesheets/app.scss'

import App from './app'
import router from './router'
import store from './store'
import i18n from './i18n'

/* eslint-disable no-new */
const app = new Vue({
  el: '#app',
  router,
  store,
  i18n,
  data: function () {
    return { loading: true }
  },
  template: '<App :loading="loading"/>',
  components: { App }
})

Vue.http.get('translations.json').then(response => {
  for (let lang in response.body) {
    i18n.setLocaleMessage(lang, response.body[lang])
  }
  app.loading = false
})
