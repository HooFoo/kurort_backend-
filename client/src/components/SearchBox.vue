<template lang="pug">
.row
  .col.s12.search-wrapper( flex=true layout='row' )
    i.material-icons search
    input.search-box( name='searchField' )
</template>

<script>
    export default {
        name: 'search-box'
    }
</script>

<style lang="scss">
.search-wrapper {
  position: relative;

  input.search-box {
    color: white;
    padding-left: 26px;
    width: 250px;

    &:focus {
      border-color: rgba(255, 255, 255, 0.87);
      box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.87);
    }
  }

  i.material-icons {
    color: white;
    position: absolute;
    top: 11px;
  }
}
</style>
