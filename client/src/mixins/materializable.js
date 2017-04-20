/* global $ */
export default {
  mounted () {
    materalizeEl(this.$el)
  },
  updated () {
    materalizeEl(this.$el)
  }
}

const materalizeEl = function (el) {
  let $el = $(el)
  $el.find('.collapsible').collapsible()
  $el.find('.tabs').tabs()
  $el.find('.dropdown-button').dropdown()
}
