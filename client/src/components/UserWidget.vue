<template lang="pug">
  .row( v-if='authLoading' )
    sidenav-loader
  .row( v-else )
    div.col.sm12( v-if='authenticated' )
      h5.white-text {{ user.email }}
      button.btn( 'v-on:click'='logout' ) Logout
    div( v-else )
      .col.s12.login-form
        ul.tabs.indigo
          li.tab.col.s6
            a.active.white-text( href='#login-form' )
              | Login
          li.tab.col.s6
            a.white-text( href='#sign-up-form' )
              | Sign up
      #login-form.col.s12
        user-login
      #sign-up-form.col.s12
        user-register
</template>
<script>
  import { mapGetters, mapState } from 'vuex'

  import UserLogin from './UserLogin'
  import UserRegister from './UserRegister'
  import SidenavLoader from './SidenavLoader'

  export default {
    name: 'user-widget',
    components: {
      'user-login': UserLogin,
      'user-register': UserRegister,
      'sidenav-loader': SidenavLoader
    },
    computed: {
      ...mapState({
        user: state => state.auth.user,
        authLoading: state => state.auth.authLoading
      }),
      ...mapGetters(['authenticated']),
      email() {
        return this.user.email;
      }
    },
    updated() {
      $(this.$el).find('.tabs').tabs()
    },
    methods: {
      logout() {
        this.$store.dispatch('logout')
      }
    }
  }

</script>
