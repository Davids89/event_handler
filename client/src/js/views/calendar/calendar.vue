<template>
  <div>
    <vue-event-calendar :events="monthEvents">
      <template>
        <div v-for="event in monthEvents" class="event-item" :key=event.id>
          <!-- In here do whatever you want, make you owner event template -->
          <div class="header">
            <span class="title">
              {{ event.title }}
            </span>

            <span class="event-date">
              {{ event.startDate }} - {{ event.endDate }}
            </span>
          </div>

          <div class="event-description">
            {{ event.description }}
          </div>

          <button @click="deleteEvent(event.id)">Delete</button>
        </div>
      </template>
    </vue-event-calendar>

    <button @click="goToCreateEvent">Create Event</button>
  </div>
</template>

<script>
import moment from 'moment'

import eventsService from '../../services/eventsService'

export default {
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
    async getEvents() {
      const events = await eventsService.show(this.currentMonth)

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
  .event-item {
    height: 6rem;
  }

  .header {
    display: flex;
    flex-direction: row;
  }

  .header .title {
    flex-grow: 4
  }
</style>