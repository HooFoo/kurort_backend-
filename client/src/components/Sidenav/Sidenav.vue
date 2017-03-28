<template lang="pug">
  ul#nav-mobile.side-nav.fixed
    li.user-panel.parent-list-item
      div.indigo
        user-widget
        search-box
    li.parent-list-item
      ul.collapsible( data-collapsible='expandable' )
        li
          div.collapsible-header.indigo.active
            i.material-icons map
            span.badge
              i.material-icons.more expand_more
              i.material-icons.less expand_less
            | Map
          div.collapsible-body
            ul
              li
                a( href='#' )
                  i.material-icons my_location
                  | My position
              li
                a( href='#' )
                  i.material-icons add_location
                  | Add point
        li
          div.collapsible-header.indigo
            i.material-icons chat
            span.badge
              i.material-icons.more expand_more
              i.material-icons.less expand_less
            | Chat
          div.collapsible-body

    div.adwords-area
      | GOOGLE ADSENSE
</template>

<script src="./Sidenav.js"></script>
<style lang="scss" src="./Sidenav.scss"></style>
