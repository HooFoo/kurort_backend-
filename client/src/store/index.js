import Vuex from 'vuex'
import Vue from 'vue'
import auth from './auth_store'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    auth: auth
  }
})
