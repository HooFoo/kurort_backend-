<template lang="pug">
  div.row
    div.col.sm12( v-if='authenticated' )
      h5.white-text {{ user.email }}
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
  /* global $ */
  import { mapState, mapActions, mapGetters } from 'vuex'

  import UserLogin from './user_login'
  import UserRegister from './user_register'

  export default {
    name: 'user-widget',
    components: {
      'user-login': UserLogin,
      'user-register': UserRegister
    },
    created () {
      this.$auth.fetch().then(user => {
        this.login(user)
      })
    },
    updated () {
      $(this.$el).find('.tabs').tabs()
    },
    computed: {
      ...mapState(['user']),
      ...mapGetters(['authenticated'])
    },
    methods: {
      ...mapActions(['login']),
      logout () {
        this.$auth.logout().then(res => this.$store.commit('logout'))
      }
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
