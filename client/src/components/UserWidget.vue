<template lang="pug">
  div.row
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
      user-login
      user-register
</template>
<script>
  /* global $ */
  import { mapState } from 'vuex'

  import UserLogin from './UserLogin'
  import UserRegister from './UserRegister'

  export default {
    name: 'user-widget',
    components: {
      'user-login': UserLogin,
      'user-register': UserRegister
    },
    created () {
      this.$auth.fetch().then(user => {
        this.$store.commit('login', user)
      })
    },
    updated () {
      $(this.$el).find('.tabs').tabs()
    },
    computed: {
      ...mapState({
        user: state => state.auth.user
      }),
      authenticated () {
        return this.user !== null
      }
    },
    methods: {
      logout () {
        this.$auth.logout().then(res => this.$store.commit('logout'))
      }
    }
  }

</script>
