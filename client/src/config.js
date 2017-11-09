import Vue from 'vue'
import * as VueGoogleMaps from 'vue2-google-maps'
import VueI18n from 'vue-i18n'

Vue.use(VueGoogleMaps, {
  load: {
    /* global GMAP_KEY */
    key: GMAP_KEY,
    v: '3',
    libraries: 'weather,geometry,visualization'
  }
})

Vue.use(VueI18n)

Vue.config.productionTip = false
