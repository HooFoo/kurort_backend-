<template lang="pug">
  transition( name="slide" )
    div.content-page( v-if="checkingAuth" )
      .loader.center-align
        .preloader-wrapper.active
          .spinner-layer.spinner-green-only
            .circle-clipper.left
              .circle
            .gap-patch
              .circle
            .circle-clipper.right
              .circle
    template( v-else )
      div.content-page( v-if="unauthorized" )
        | You are not authorized to see this page
      div.content-pate( v-else )
        router-link.close( to='/' ) ×
        slot
</template>

<script>
  import { mapGetters } from 'vuex'

  export default {
    props: ['authenticate'],
    computed: {
      ...mapGetters(['authenticated']),
      checkingAuth: function () {
        return this.authenticate && this.$store.state.authentication
      },
      unauthorized: function () {
        return this.authenticate && !this.authenticated
      }
    }
  }
</script>

<style lang="scss">
  .content-page {
    position: relative;
    padding-left: 10px;

    .close {
      position: absolute;
      top: 0;
      line-height: 12px;
      right: 5px;
      font-size: 26px;
    }
  }

  .slide-enter-active {
    transition: all .3s ease;
  }
  .slide-leave-active {
    transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
  }
  .slide-enter, .slide-leave-to {
    transform: translateX(100%);
    opacity: 0;
  }

  .loader {
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
  }
</style>
