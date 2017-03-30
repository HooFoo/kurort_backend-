<template lang="pug">
  div
    navbar
    sidenav
    g-map
</template>


<script>
  import Navbar from './Navbar'
  import Sidenav from './Sidenav'
  import GMap from './GMap'

  export default {
    name: 'index',
    components: {
      navbar: Navbar,
      sidenav: Sidenav,
      'g-map': GMap
    }
  }

</script>
