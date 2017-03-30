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
        email: payload.email,
        id: payload.id
      }
    },
    logout (state) {
      state.user = null
    }
  }
}
