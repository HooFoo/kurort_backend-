// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import './config.js'
import VueResource from 'vue-resource'

import 'materialize-css/dist/js/materialize.min.js'
import 'materialize-css/dist/css/materialize.min.css'
import './assets/stylesheets/app.scss'

import App from './App';
import router from './router';

Vue.use(VueResource)

Vue.http.options.root = 'http://localhost:3100'

Vue.config.productionTip = false;

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
});
