<template lang="pug">
  gmap-marker( ':position'="position" )
</template>
<script>
  export default {
    name: 'map-marker',
    props: ['position'],
    created () {
      console.log(this.position)
      console.log(this.icon)
    }
  }
</script>
<style>
</style>
