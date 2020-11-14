import {shallowMount} from '@vue/test-utils'
import CalendarEvent from '../../src/js/components/calendar-event/calendar-event.vue'

describe('Calendar view', () => {
  const wrapper = shallowMount(CalendarEvent, {
    propsData: {
      event: {
        title: 'Title'
      }
    }
  });

  it('is a Vue instance', () => {
    expect(wrapper.vm).toBeTruthy()
  })
})