import CalendarView from '../views/calendar/calendar.vue'
import EventNew from '../views/event/new.vue'
import EventUpdate from '../views/event/update.vue'

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
    path: '/event/update/:id',
    name: 'EventUpdate',
    component: EventUpdate
  },
  {
    path: '*',
    redirect: '/'
  }
]