import Vue from 'vue'

export default {
  buildResource (name, customActions) {
    return Vue.resource(`${name}{/id}.json`, {}, customActions)
  }
}
