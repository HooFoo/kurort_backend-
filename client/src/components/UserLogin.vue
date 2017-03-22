<template lang="pug">
form.user-form( novalidate=true )
  .input-field
    label(for='email') Email
    input.user-form-input( name='email' type='text' )
  .input-field
    label(for='password') Password
    input.user-form-input( name='password' type='password' )
  input.btn( type='submit' value='Register' )
</template>

<script>
    export default {
        name: 'user-login'
    }
</script>
