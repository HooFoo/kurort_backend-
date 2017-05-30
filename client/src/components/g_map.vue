<template lang="pug">
  .flex.layout-column
    #map
      gmap-map( ':center'="center" ':zoom'="zoom" '@center_changed'='updateCenter' ref="gmap")
</template>
<script>
  import { EventBus } from '../event_bus'

  export default {
    data () {
      return {
        center: this.$store.state.mapCenter,
        cachedCenter: this.$store.state.mapCenter,
        zoom: 13
      }
    },
    created () {
      EventBus.$on('toCurrentPosition', () => {
        this.$refs.gmap.panTo(this.$store.state.userPosition)
      })
    },
    beforeRouteLeave () {
      this.$store.commit('setMapCenter', this.cachedCenter)
    },
    methods: {
      updateCenter (center) {
        this.cachedCenter.lat = center.lat()
        this.cachedCenter.lng = center.lng()
      }
    }
  }

</script>
<style lang="scss">
  .vue-map-container {
    height: calc(100vh - 56px);
  }
</style>
