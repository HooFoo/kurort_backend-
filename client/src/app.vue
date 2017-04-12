<template lang="pug">
  #app
    template( v-if="loading" )
      | Loading
    template( v-else )
      router-view
</template>
<script>
  export default {
    name: 'app',
    props: ['loading']
  }
</script>
