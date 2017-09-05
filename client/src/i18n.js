import VueI18n from 'vue-i18n'

const i18n = new VueI18n({
  locale: 'ru'
})
/* global TRANSLATIONS */
for (let lang in TRANSLATIONS) {
  i18n.setLocaleMessage(lang, TRANSLATIONS[lang])
}

export default i18n
