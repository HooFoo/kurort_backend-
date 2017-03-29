import Vue from 'vue';
import * as VueGoogleMaps from 'vue2-google-maps';
import VueResource from 'vue-resource'

Vue.use(VueGoogleMaps, {
  load: {
    key: GMAP_KEY,
    v: '3.26',
    libraries: 'weather,geometry,visualization'
  }
});

Vue.use(VueResource)
Vue.http.options.root = API_URL;
Vue.http.options.xhr = { withCredentials: true };
Vue.http.options.emulateJSON = true;
console.log(GMAP_KEY);

Vue.config.productionTip = false;
