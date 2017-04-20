<template lang="pug">
  #sign-up-form.col.s12
    sidenav-loader( v-bind:class="{ hide: !loading }" )
    form.user-form( "v-on:submit.prevent"="submit" v-bind:class="{ hide: loading }" novalidate )
      .input-field
        input#email.user-form-input( name="email", type="text" v-model="email" v-bind:class="{ invalid: errors.email }" )
        label( for="email" v-bind:data-error="errors.email" ) {{ $t('activerecord.attributes.user.email') }}
      .input-field
        input#password.user-form-input( name="password", type="password" v-model="password" v-bind:class="{ invalid: errors.password }" )
        label( for="password" v-bind:data-error="errors.password" ) {{ $t('activerecord.attributes.user.password') }}
      .input-field
        input#password_confirmation.user-form-input( name="password_confirmation" type="password" v-model="passwordConfirmation" v-bind:class="{ invalid: errors.passwordConfirmation }" )
        label( for="password_confirmation" v-bind:data-error="errors.passwordConfirmation" )
          | {{ $t('activerecord.attributes.user.password_confirmation') }}
      input.btn( type="submit", v-bind:value="$t('devise.registrations.new.sign_up')" )
</template>

<script>
  import { mapActions, mapState } from 'vuex'
  import SidenavLoader from './sidenav_loader'

  export default {
    name: 'user-register',
    components: {
      'sidenav-loader': SidenavLoader
    },
    data () {
      return {
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
    computed: mapState(['langId']),
    methods: {
      ...mapActions(['register']),
      submit () {
        let { email, password, passwordConfirmation, langId } = this
        this.loading = true
        this.register({ email, password, passwordConfirmation, langId })
          .catch(errors => {
            ['email', 'password', 'passwordConfirmation'].forEach((attr) => {
              this.errors[attr] = errors[attr] ? errors[attr][0] : null
            })
          }).then(() => { this.loading = false })
      }
    }
  }
</script>
