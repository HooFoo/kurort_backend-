<template lang="pug">
  #sign-up-form.col.s12
    sidenav-loader( v-bind:class="{ hide: !loading }" )
    form.user-form( "v-on:submit.prevent"="submit" v-bind:class="{ hide: loading }" novalidate )
      .input-field
        input#username.user-form-input( name="username", type="text" v-model="username" v-bind:class="{ invalid: errors.username }" )
        label( for="username" v-bind:data-error="errors.username" ) Username
      .input-field
        input#email.user-form-input( name="email", type="text" v-model="email" v-bind:class="{ invalid: errors.email }" )
        label( for="email" v-bind:data-error="errors.email" ) Email
      .input-field
        input#password.user-form-input( name="password", type="password" v-model="password" v-bind:class="{ invalid: errors.password }" )
        label( for="password" v-bind:data-error="errors.password" ) Password
      .input-field
        input#password_confirmation.user-form-input( name="password_confirmation" type="password" v-model="passwordConfirmation" v-bind:class="{ invalid: errors.passwordConfirmation }" )
        label( for="password_confirmation" v-bind:data-error="errors.passwordConfirmation" ) Password confirmation
      input.btn( type="submit", value="Register" )
</template>

<script>
  import SidenavLoader from './SidenavLoader'

  export default {
    name: 'user-register',
    components: {
      'sidenav-loader': SidenavLoader
    },
    data () {
      return {
        username: '',
        email: '',
        password: '',
        passwordConfirmation: '',
        loading: false,
        errors: {
          username: null,
          email: null,
          password: null,
          passwordConfirmation: null
        }
      }
    },
    updated () {
      /* global Materialize */
      Materialize.updateTextFields()
    },
    methods: {
      submit () {
        let data = {
          username: this.username,
          email: this.email,
          password: this.password,
          password_confirmation: this.passwordConfirmation
        }
        this.loading = true
        this.$auth.register(data)
          .then(user => {
            this.$store.commit('login', user)
          }, errors => {
            this.errors.username = errors.username ? errors.username[0] : null
            this.errors.email = errors.email ? errors.email[0] : null
            this.errors.password = errors.password ? errors.password[0] : null
            this.errors.passwordConfirmation = errors.password_confirmation ? errors.password_confirmation[0] : null
          }).catch().then(() => { this.loading = false })
      }
    }
  }
</script>
