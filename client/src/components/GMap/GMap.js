import * as VueGoogleMaps from 'vue2-google-maps';
import Vue from 'vue';

Vue.use(VueGoogleMaps, {
  load: {
    key: '',
    v: '3.26',
    libraries: 'weather,geometry,visualization'
  }
});

export default {
  data() {
    return {
      center: { lat: 55.75370903771494, lng: 37.61981338262558 },
      zoom: 13
    }
  },
  created() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position)=>
        this.center = { lat: position.coords.latitude, lng: position.coords.longitude }
      )
    }
  }
}
