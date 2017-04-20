<template lang="pug">
  header
    ul#langs-dropdown.dropdown-content
      template( v-for="lang, id in langs" )
        li
          a( href="#!" v-on:click.prevent="setLanguage(id)")
            img( v-if="lang.attributes.icon" ':src'="lang.attributes.icon" width="16" )
            | &nbsp;
            | {{ lang.attributes.name }}
    nav.top-nam.indigo
      .container
        .nav-wrapper
          a.button-collapse.top-nav.full.hide-on-large-only(href="#" data-activates="nav-mobile")
            i.material-icons
              | menu
          a.page-title
            | Kurort
          ul.right
            li
              a.dropdown-button( href="#!" data-activates="langs-dropdown" )
                | Language
                i.material-icons.right arrow_drop_down
</template>
<script>
  import { mapState, mapActions } from 'vuex'

  import materializable from '@/mixins/materializable'

  export default {
    name: 'navbar',
    mixins: [materializable],
    computed: mapState(['langs']),
    methods: mapActions(['setLanguage', 'fetchLanguages']),
    created () {
      this.fetchLanguages()
    }
  }
</script>
<style lang="scss">
  .nav-wrapper {
    text-align: center;
  }
</style>
