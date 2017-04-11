import VueI18n from 'vue-i18n'
let I18n = window.I18n = require(`../../public/javascripts/i18n.js`)
require(`../../public/javascripts/translations.js`)
const i18n = new VueI18n({
  locale: 'ru',
  messages: I18n.translations
})

export default i18n
