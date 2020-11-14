import {shallowMount} from '@vue/test-utils'
import {render, fireEvent} from '@testing-library/vue'
import CalendarEvent from '../../src/js/components/calendar-event/calendar-event.vue'

describe('Calendar view', () => {
  it('is a Vue instance', () => {
    const wrapper = shallowMount(CalendarEvent, {
      propsData: {
        event: {
          title: 'Title'
        }
      }
    });

    expect(wrapper.vm).toBeTruthy()
  })

  describe('Event calendar render', () => {
    let wrapper

    beforeEach(() => {
      const localVue = createLocalVue()
      localVue.use(VueRouter)
      const router = new VueRouter()

      wrapper = render(CalendarEvent, {
        localVue,
        router,
        propsData: {
          event: {
            title: 'Title',
            startDate: '13/11/2020',
            endDate: '14/11/2020',
            description: 'Event description'
          }
        }
      })
    })

    it('renders component correctly', () => {
      // getByText returns the first matching node for the provided text and throw an error it no
      // elements are found
      wrapper.getByText('Title')
      wrapper.getByText('13/11/2020 - 14/11/2020')
      wrapper.getByText('Event description')
    })

    it('has update button', () => {
      wrapper.getByText('Update')
    })

    it('has delete button', () => {
      wrapper.getByText('Delete')
    })
  })
})