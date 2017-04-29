<template lang="pug">
  gmap-marker( ':position'="point.position" ':icon'="point.icon" '@click'="onClick" )
</template>
<script>
  export default {
    name: 'map-marker',
    props: ['point'],
    methods: {
      onClick () {
        console.log('cliiiiick')
      }
    }
  }
</script>
<style>
</style>
