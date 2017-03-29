<template lang="pug">
  header
    nav.top-nam.indigo
      .container
        .nav-wrapper
          a.button-collapse.top-nav.full.hide-on-large-only(href="#" data-activates="nav-mobile")
            i.material-icons
              | menu
          a.page-title
            | Kurort
</template>
<script>
  export default {
    name: 'navbar'
  }
</script>
