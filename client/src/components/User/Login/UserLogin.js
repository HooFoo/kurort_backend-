export default {
  name: 'user-login',
  data() {
    return {
      email: '',
      password: ''
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
      this.$http.post('http://localhost:3100/users/sing_in', data).then((response)=>
        console.log(response)
      )
    }
  }
}
