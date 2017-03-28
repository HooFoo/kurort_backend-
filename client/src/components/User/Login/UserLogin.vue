<template lang="pug">
  form.user-form( novalidate=true 'v-on:submit.prevent'='submit')
    .input-field
      label(for='email') Email
      input.validate( name='email' type='text' v-model='email' )
    .input-field
      label(for='password') Password
      input.validate( name='password' type='password' v-model='password' )
    input.btn( type='submit' value='Register' )
</template>

<script src="./UserLogin.js"></script>
