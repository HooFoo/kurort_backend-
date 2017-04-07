<template lang="pug">
  div
    navbar
    sidenav
    g-map
</template>


<script>
  import Navbar from './navbar'
  import Sidenav from './sidenav'
  import GMap from './g_map'

  export default {
    name: 'index',
    components: {
      navbar: Navbar,
      sidenav: Sidenav,
      'g-map': GMap
    }
  }

</script>
