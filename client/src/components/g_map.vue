<template lang="pug">
  .flex.layout-column
    #map
      gmap-map( ':center'="center" ':zoom'="zoom" '@idle'="updatePoints" 'ref'="map" )
        template( 'v-for'="point in points" )
          map-marker( ':point'= "point" )
</template>
<script>
  import MapMarker from './map_marker'

  export default {
    components: {
      'map-marker': MapMarker
    },
    data () {
      return {
        center: { lat: 55.75370903771494, lng: 37.61981338262558 },
        zoom: 13,
        points: []
      }
    },
    created () {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(position => {
          this.center = { lat: position.coords.latitude, lng: position.coords.longitude }
        })
        return this.center
      }
    },
    methods: {
      updatePoints () {
        let bounds = this.$refs.map.$mapObject.getBounds()
        if (bounds) {
          let parsed = {
            swLat: bounds.getSouthWest().lat(),
            swLng: bounds.getSouthWest().lng(),
            neLat: bounds.getNorthEast().lat(),
            neLng: bounds.getNorthEast().lng()
          }
          this.$api.points.forRect({ rect: parsed })
            .then(response => {
              this.points = response.body.points
            }).catch(response => { console.log(response) })
        }
      }
    }
  }

</script>
<style lang="scss">
  .vue-map-container {
    height: calc(100vh - 56px);
  }
</style>
