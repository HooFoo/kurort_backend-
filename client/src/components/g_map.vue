<template lang="pug">
  .flex.layout-column
    #map
      gmap-map( ':center'="center" ':zoom'="zoom")
</template>
<script>
  export default {
    data () {
      return {
        center: { lat: 55.75370903771494, lng: 37.61981338262558 },
        zoom: 13
      }
    },
    created () {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(position => {
          this.center = { lat: position.coords.latitude, lng: position.coords.longitude }
        })
        return this.center
      }
    }
  }

</script>
<style lang="scss">
  .vue-map-container {
    height: calc(100vh - 56px);
  }
</style>
