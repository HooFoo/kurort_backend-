<template lang="pug">
  #app
    navbar
    sidebar
    .page-container
      router-view
</template>
<script>
  import navbar from './components/navbar'
  import sidebar from './components/sidebar'

  export default {
    name: 'app',
    components: { navbar, sidebar }
  }
</script>

<style lang="scss">
  @media (min-width: 993px) {
    .page-container {
      padding-left: 300px;
    }
  }
</style>
