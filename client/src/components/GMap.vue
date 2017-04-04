<template lang="pug">
  .flex.layout-column
    #map
      gmap-map( ':center'="center" ':zoom'="zoom" '@idle'="updatePoints" 'ref'="map")
        gmap-marker( ':position'="center" )
        template( 'v-for'="point in points" )
          gmap-marker( ':position'= "point.position" ':icon'="point.icon" )
</template>
<script>
  import Point from '@/resources/point'
  import MapMarker from './MapMarker'

  export default {
    componets: {
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
          return
        })
        return this.center
      }
    },
    methods: {
      updatePoints () {
        let bounds = this.$refs.map.$mapObject.getBounds()
        if (bounds) {
          var parsed = {
            sw: {
              lat: bounds.getSouthWest().lat(),
              lng: bounds.getSouthWest().lng()
            },
            ne: {
              lat: bounds.getNorthEast().lat(),
              lng: bounds.getNorthEast().lng()
            }
          }
          Point.forRect({}, {rect: parsed}).then(response => {
            this.points = []
            response.body.data.forEach(point => {
              let mapped = {
                id: point.id,
                position: {
                  lat: point.attributes.lat,
                  lng: point.attributes.lng
                },
                icon: point.attributes['point-type'].icon
              }
              this.points.push(mapped)
            })
          },
          response => { console.log(response) })
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
