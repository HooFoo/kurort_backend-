<template lang="pug">
  div.row
    div.col.sm12( v-if='authenticated' )
      router-link( to='/profile' ) {{ user.email }}
      button.btn( 'v-on:click'='logout' ) {{ $t('log_out') }}
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
</style>
