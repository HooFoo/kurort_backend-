<template lang="pug">
  #login-form.col.s12
    sidenav-loader( v-bind:class="{ hide: !loading }" )
    .error( v-if="hasError" ) {{ error }}
    form.user-form( v-on:submit.prevent="submit" v-bind:class="{ hide: loading }" novalidate )
      .error( v-if="hasError") {{ errorMsg }}
      .input-field
        input#email.validate( name="email" type="text" v-model="email" )
        label( for="email" ) Email
      .input-field
        input#password.validate( name="password" type="password" v-model="password" )
        label(for="password") Password
      input.btn( type="submit" value="Login" v-bind:disabled="!this.email && !this.password")
</template>

<script>
  import SidenavLoader from './sidenav_loader'

  export default {
    name: 'user-login',
    components: {
      'sidenav-loader': SidenavLoader
    },
    data () {
      return {
        email: '',
        password: '',
        error: '',
        loading: false
      }
    },
    computed: {
      hasError () {
        return !!this.error
      }
    },
    methods: {
      submit () {
        this.loading = true
        const data = {
          email: this.email,
          password: this.password
        }
        this.$auth.login(data).then(
          user => { this.$store.commit('login', user) },
          error => {
            console.log(error)
            this.error = error
          }
        ).catch().then(() => { this.loading = false })
      }
    }
  }

</script>
