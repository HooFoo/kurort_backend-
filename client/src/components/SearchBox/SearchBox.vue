<template lang="pug">
  .row
    .col.s12.search-wrapper( flex=true layout='row' )
      i.material-icons search
      input.search-box( name='searchField' v-model='searchString' )
</template>
<script src="./SearchBox.js"></script>
<style lang="scss" src="./SearchBox.scss"></style>
