import CalendarView from '../views/calendar/calendar.vue'

export default [
  {
    path: '/',
    name: 'calendar',
    component: CalendarView
  },
  {
    path: '*',
    redirect: '/'
  }
]