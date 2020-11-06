import CalendarView from '../views/calendar/calendar.vue'
import EventNew from '../views/event/new.vue'

export default [
  {
    path: '/',
    name: 'calendar',
    component: CalendarView
  },
  {
    path: '/event/new',
    name: 'EventNew',
    component: EventNew
  },
  {
    path: '*',
    redirect: '/'
  }
]