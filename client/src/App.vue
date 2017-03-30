<template lang="pug">
  router-view
</template>
<script>
  export default {
    name: 'app',
    created() {
      this.$store.dispatch('checkAuth')
    }
  }
</script>
