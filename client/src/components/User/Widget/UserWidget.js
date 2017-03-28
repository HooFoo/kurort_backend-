import UserLogin from '../Login/UserLogin.vue'
import UserRegister from '../Register/UserRegister.vue'

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
