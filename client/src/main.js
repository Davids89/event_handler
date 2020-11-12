import i18n from './js/i18n'
import router from './js/router'
import VueI18n from 'vue-i18n'
import Vue from 'vue'
import VueResource from 'vue-resource'

import 'vue-event-calendar/dist/style.css'
import vueEventCalendar from 'vue-event-calendar'

import './vue-resource-config'

Vue.use(VueI18n)
Vue.use(VueResource)
Vue.use(vueEventCalendar, {locale: 'en'})

Vue.http.options.root = API_HOST

new Vue({
  router,
  i18n
}).$mount('#app')
