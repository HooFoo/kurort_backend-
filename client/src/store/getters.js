export const authenticated = state => state.user !== null

export const currentLang = state => state.langs[state.langId]
