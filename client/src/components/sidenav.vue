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
            | {{ $t('map') }}
          div.collapsible-body
            ul
              li
                a( href="#" )
                  i.material-icons my_location
                  | {{ $t('my_position') }}
              li
                a( href="#" )
                  i.material-icons add_location
                  | {{ $t('add_point') }}
        li
          div.collapsible-header.indigo
            i.material-icons chat
            span.badge
              i.material-icons.more expand_more
              i.material-icons.less expand_less
            | {{ $t('chat') }}
          div.collapsible-body

    div.adwords-area
      | GOOGLE ADSENSE
</template>

<script>
  import UserWidget from './user_widget'
  import SearchBox from './search_box'

  export default {
    name: 'sidenav',
    components: {
      'user-widget': UserWidget,
      'search-box': SearchBox
    },
    updated () {
      /* global $ */
      $(this.$el).find('.collapsible').collapsible()
    }
  }
</script>
<style lang="scss">
  @import '../assets/stylesheets/variables';

  .sign-up-submit {
    width: 60%;
    margin: 0px auto;
    transition: width 0.3s ease-in-out;
  }
  .sign-up-submit.form-filled {
    width: 100%;
  }

  .login-form {
    input.btn {
      box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
      background-color: $primary-color;
      border-radius: 0;

      &:active {
        background-color: darken($primary-color, 5);
      }
    }
  }

  .side-nav li {
    &.user-panel {
      line-height: 1.5;
      border-bottom: 1px solid #5C6BC0;
      > .indigo {
        padding-top: 1em;
        margin-top: -1em;
        overflow: hidden;
      }
    }

    .collapsible-body {
      padding: 0;

      ul {
        li {
          a {
            padding: 0 37.5px 0 45px;
          }
        }
      }
    }

    .collapsible-header {
      color: white;

      .material-icons {
        color: white;
      }

      .less {
        display: none;
      }

      &.active {
        .less {
          display: inline-block;
        }
        .more {
          display: none;
        }
      }
    }
  }

  .nav-subcat {
    color: white;
    padding-left: 10px;
  }
  .subcat{
    color: black;
    text-align: left;
    text-transform: none;
  }
  .adwords-area {
    width: 100%;
    color: rgba(100, 100, 100, 0.2);
    text-align: center;
    vertical-align: middle;
  }

  .autocomplete-item {
    color: black;
  }
</style>
