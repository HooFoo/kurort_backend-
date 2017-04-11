import Vuex from 'vuex'
import Vue from 'vue'
import mutations from './mutations'
import * as getters from './getters'
import * as actions from './actions'

Vue.use(Vuex)

const state = {
  user: null,
  langs: [],
  lang: null
}

export default new Vuex.Store({
  state,
  getters,
  mutations,
  actions
})
