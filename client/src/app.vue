<template lang="pug">
  #app
    template( v-if="loading" )
      | Loading
    template( v-else )
      navbar
      sidebar
      .page-container
        router-view
</template>
<script>
  import i18n from './i18n'
  import navbar from './components/navbar'
  import sidebar from './components/sidebar'

  export default {
    name: 'app',
    components: { navbar, sidebar },
    data () {
      return {
        loading: true
      }
    },
    created () {
      this.$http.get('translations.json').then(response => {
        for (let lang in response.body) {
          i18n.setLocaleMessage(lang, response.body[lang])
        }
        this.loading = false
      })
    }
  }
</script>

<style lang="scss">
  @media (min-width: 993px) {
    .page-container {
      padding-left: 300px;
    }
  }
</style>
