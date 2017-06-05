<template lang="pug">
  transition( name="slide" )
    div.content-page
      router-link.close( to='/' ) ×
      slot
</template>

<style lang="scss">
  .content-page {
    position: relative;
    padding-left: 10px;

    .close {
      position: absolute;
      top: 5px;
      right: 5px;
      font-size: 22px;
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
</style>
