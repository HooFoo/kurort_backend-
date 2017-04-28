<template lang="pug">
  #app
    template( v-if="loading" )
      | Loading
    template( v-else )
      navbar
      sidebar
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
