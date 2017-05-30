import Vuex from 'vuex'
import Vue from 'vue'
import mutations from './mutations'
import * as getters from './getters'
import * as actions from './actions'

Vue.use(Vuex)

const state = {
  user: null,
  langs: [],
  langId: null,
  mapCenter: { lat: 55.75370903771494, lng: 37.61981338262558 },
  userPosition: { lat: 55.75370903771494, lng: 37.61981338262558 }
}

export default new Vuex.Store({
  state,
  getters,
  mutations,
  actions
})
