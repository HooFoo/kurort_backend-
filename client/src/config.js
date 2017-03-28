import Vue from 'vue';
import * as VueGoogleMaps from 'vue2-google-maps';
import VueResource from 'vue-resource'

Vue.use(VueGoogleMaps, {
  load: {
    key: '',
    v: '3.26',
    libraries: 'weather,geometry,visualization'
  }
});

Vue.use(VueResource)

Vue.http.options.root = 'http://localhost:3100'

Vue.config.productionTip = false;
