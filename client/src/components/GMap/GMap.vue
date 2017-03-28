<template lang="pug">
  .flex.layout-column
    #map
      gmap-map( ':center'="center" ':zoom'="zoom")

</template>
<script src="./GMap.js"></script>
<style src="./GMap.scss" lang="scss"></style>
