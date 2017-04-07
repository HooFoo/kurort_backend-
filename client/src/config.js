import Vue from 'vue'
import * as VueGoogleMaps from 'vue2-google-maps'
import VueResource from 'vue-resource'
import VueAuth from './plugins/vue_auth'

Vue.use(VueGoogleMaps, {
  load: {
    /* global GMAP_KEY */
    /* eslint no-undef: "error" */
    key: GMAP_KEY,
    v: '3.26',
    libraries: 'weather,geometry,visualization'
  }
})

Vue.use(VueResource)
Vue.use(VueAuth)
/* global API_URL */
/* eslint no-undef: "error" */
Vue.http.options.root = API_URL
Vue.http.options.xhr = { withCredentials: true }
Vue.http.options.emulateJSON = true

Vue.config.productionTip = false
