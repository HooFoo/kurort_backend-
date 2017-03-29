<template lang="pug">
  form.user-form( novalidate=true 'v-on:submit.prevent'='submit' )

    .input-field
      label( for='username' ) Username
      input#username.user-form-input( name='username', type='text' v-model='username' )
    .input-field
      label( for='email' ) Email
      input#email.user-form-input( name='email', type='text' v-model='email' )
    .input-field
      label( for='password' ) Password
      input#password.user-form-input( name='password', type='password' v-model='password' )
    .input-field
      label( for='password_confirmation' ) Password confirmation
      input#password_confirmation.user-form-input( name='password_confirmation', type='password' v-model='passwordConfirmation' )
    input.btn( type='submit', value='Register' )
</template>

<script>
  import { mapState } from 'vuex'
  import SidenavLoader from '../SidenavLoader/SidenavLoader.vue'

  export default {
    name: 'user-register',
    components: {
      'sidenav-loader': SidenavLoader
    },
    data() {
      return {
        username: '',
        email: '',
        password: '',
        passwordConfirmation: ''
      }
    },
    computed: {
      ...mapState({
        errorMsg: state => state.auth.registerErrorMsg
      }),
      hasError: function() {
        return !!this.errorMsg
      }
    },
    methods: {
      submit() {
        const data = {
          user: {
            username: this.username,
            email: this.email,
            password: this.password,
            password_confirmation: this.passwordConfirmation
          }
        }
        this.$store.dispatch('register', data)
      }
    }
  }

</script>
