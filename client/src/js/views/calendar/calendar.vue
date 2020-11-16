<template>
  <div>
    <button
      class="create-button"
      @click="goToCreateEvent"
    >Create Event</button>

    <vue-event-calendar :events="monthEvents" @month-changed="monthChanged">
      <template>
        <div v-for="event in monthEvents" class="event-item" :key=event.id>
          <calendar-event
            :event="event"
            @deleteEvent="deleteEvent"
          />
        </div>
      </template>
    </vue-event-calendar>
  </div>
</template>

<script>
import moment from 'moment'

import CalendarEvent from '../../components/calendar-event/calendar-event'

import eventsService from '../../services/eventsService'

export default {
  components: {
    CalendarEvent
  },

  data() {
    return {
      currentMonth: moment().month() + 1, // moment starts months in 0 (January)
      monthEvents: []
    }
  },

  mounted() {
    this.getEvents()
  },

  methods: {
    async monthChanged(yearMonth) {
      const month = yearMonth.split('/')[0]

      this.getEvents(month)
    },

    async getEvents(month = this.currentMonth) {
      this.monthEvents = []

      const events = await eventsService.show(month)

      events.forEach(event => {
      const eventDate = moment(event.start_date).format('YYYY/MM/DD')
      const eventStartDate = moment(event.start_date).format('DD/MM/YYYY')
      const eventEndDate = moment(event.end_date).format('DD/MM/YYYY')

      const params = {
        date: eventDate,
        description: event.description,
        endDate: eventEndDate,
        id: event.id,
        startDate: eventStartDate,
        title: event.title
      }

      this.monthEvents.push(params)
    })
    },

    async deleteEvent(id) {
      await eventsService.delete(id)

      this.monthEvents = this.monthEvents.filter(event => event.id !== id)
    },

    goToCreateEvent() {
      this.$router.push({name: 'EventNew'})
    }
  }
}

</script>

<style>
  @import url('https://fonts.googleapis.com/css?family=Nunito+Sans');

  body {
    font-family: 'Nunito Sans';
  }

  .create-button {
    background-color: white;
    height: 3rem;
    font-size: 1rem;
    border-radius: 0.3rem;
  }
</style>