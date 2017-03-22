<template lang="pug">
div.row
  div( v-if='logged' )
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
    import UserLogin from './UserLogin'
    import UserRegister from './UserRegister'

    export default {
        name: 'user-widget',
        components: {
            'user-login': UserLogin,
            'user-register': UserRegister
        },
        data() {
          return {
            logged: false
          }
        }
    }
</script>
