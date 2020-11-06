import Vue from 'vue'
import router from './js/router'
import VueResource from 'vue-resource'

import 'vue-event-calendar/dist/style.css'
import vueEventCalendar from 'vue-event-calendar'

import './vue-resource-config'

Vue.use(VueResource)
Vue.use(vueEventCalendar, {locale: 'en'})

Vue.http.options.root = API_HOST

new Vue({
  router
}).$mount('#app')
