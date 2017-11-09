<template lang="pug">
  div.row
    div.user-nav( v-if='authenticated' )
      ul#user_dropdown.dropdown-content
        li
          router-link( to="/profile" ) {{ $t('user.edit') }}
        li
          a( v-on:click.prevent="logout" ) {{ $t('log_out') }}
      a.dropdown-button.btn.indigo( href="#" data-activates="user_dropdown" )
        | {{ user.email }}
        i.material-icons.right arrow_drop_down
      //button.btn( 'v-on:click'='logout' ) {{ $t('log_out') }}
    div( v-else )
      .col.s12.login-form
        ul.tabs.indigo
          li.tab.col.s6
            a.active.white-text( href="#login-form" )
              | {{ $t('devise.shared.links.sign_in') }}
          li.tab.col.s6
            a.white-text( href="#sign-up-form" )
              | {{ $t('devise.shared.links.sign_up') }}
      user-login
      user-register
</template>
<script>
  import { mapState, mapActions, mapGetters } from 'vuex'

  import UserLogin from './user_login'
  import UserRegister from './user_register'
  import materializable from '@/mixins/materializable'

  export default {
    name: 'user-widget',
    mixins: [materializable],
    components: {
      'user-login': UserLogin,
      'user-register': UserRegister
    },
    created () {
      this.checkAuth()
    },
    computed: {
      ...mapState(['user']),
      ...mapGetters(['authenticated'])
    },
    methods: {
      ...mapActions(['checkAuth', 'logout'])
    }
  }

</script>

<style lang="scss" scope>
  .login-form {
    a.white-text {
      font-size: 12px;
    }
  }
  .user-nav .btn {
    width: 100%;
  }
</style>
