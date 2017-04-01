export default {
  state: {
    user: null
  },
  getters: {
    authenticated: state => state.user !== null
  },
  mutations: {
    login (state, payload) {
      state.user = {
        email: payload.attributes.email,
        id: payload.attributes.id
      }
    },
    logout (state) {
      state.user = null
    }
  }
}
