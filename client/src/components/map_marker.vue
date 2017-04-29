<template lang="pug">
  gmap-marker( ':position'="point.attributes.position" ':icon'="point.attributes.icon" '@click'="onClick" )
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
