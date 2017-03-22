<template lang="pug">
form.user-form( novalidate=true )
  .input-field
    label( for='username' ) Username
    input.user-form-input( name='username', type='text' )
  .input-field
    label( for='email' ) Email
    input.user-form-input( name='email', type='text' )
  .input-field
    label( for='password' ) Password
    input.user-form-input( name='password', type='password' )
  .input-field
    label( for='password_confirmation' ) Password confirmation
    input.user-form-input( name='password_confirmation', type='password' )
  input.btn( type='submit', value='Login' )

</template>

<script>
    export default {
        name: 'user-register'
    }
</script>
