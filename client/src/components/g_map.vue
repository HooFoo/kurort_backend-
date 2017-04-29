<template lang="pug">
  .flex.layout-column
    #map
      gmap-map( ':center'="center" ':zoom'="zoom" '@idle'="updatePoints" 'ref'="map" )
        template( 'v-for'="point in points" )
          map-marker( ':point'= "point" )
</template>
<script>
  import _ from 'lodash'
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
            sw: {
              lat: bounds.getSouthWest().lat(),
              lng: bounds.getSouthWest().lng()
            },
            ne: {
              lat: bounds.getNorthEast().lat(),
              lng: bounds.getNorthEast().lng()
            }
          }
          this.$api.points.forRect({}, { rect: parsed })
            .then(response => {
              this.points = []
              _.each(_.values(response.body.points), point => {
                let mapped = {
                  id: point.id,
                  position: {
                    lat: point.attributes.lat,
                    lng: point.attributes.lng
                  },
                  icon: point.attributes.pointType.icon.url
                }
                this.points.push(mapped)
              })
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
