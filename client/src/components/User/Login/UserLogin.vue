<template lang="pug">
  form.user-form( novalidate=true 'v-on:submit.prevent'='submit')
    .error( v-if='hasError') {{ errorMsg }}
    .input-field
      label(for='email') Email
      input#email.validate( name='email' type='text' v-model='email' )
    .input-field
      label(for='password') Password
      input#password.validate( name='password' type='password' v-model='password' )
    input.btn( type='submit' value='Login' )
</template>

<script>
  import { mapState, mapGetters } from 'vuex'
  import SidenavLoader from './SidenavLoader'

  export default {
    name: 'user-login',
    components: {
      'sidenav-loader': SidenavLoader
    },
    data() {
      return {
        email: '',
        password: ''
      }
    },
    computed: {
      ...mapState({
        errorMsg: state => state.auth.loginErrorMsg
      }),
      hasError: function() {
        return !this.loginErrorMsg
      }
    },
    methods: {
      submit() {
        const data = {
          user: {
            email: this.email,
            password: this.password
          }
        }
        this.$store.dispatch('login', data)
      }
    }
  }

</script>
