<template>
  <div class="event-form-wrapper">
    <div class="event-form-item">
      <span>Event title</span>
      <input
        v-model="event.title"
        type="text"
        placeholder="Your event title"
      >
    </div>
    <div class="event-form-item">
      <span>Start date</span>
      <input
        v-model="event.startDate"
        type="date"
      >
    </div>
    <div class="event-form-item">
      <span>End date</span>
      <input
        v-model="event.endDate"
        type="date"
      >
    </div>
    <div class="event-form-item">
      <span>Description</span>
      <input
        v-model="event.description"
        type="text"
      >
    </div>

    <button @click="createEvent">Create event</button>
  </div>
</template>

<script>
  import moment from 'moment'

  import eventsService from '../../services/eventsService'

  export default {
    data() {
      return {
        event: {
          description: '',
          endDate: moment().format('YYYY-MM-DD'),
          startDate: moment().format('YYYY-MM-DD'),
          title: ''
        }
      }
    },

    methods: {
      createEvent() {
        const params = {
          title: this.event.title,
          description: this.event.description,
          start_date: this.event.startDate,
          end_date: this.event.endDate
        }

        eventsService.create(params).then(response => {
          this.$router.push({name: 'calendar'})
        })
      }
    }
  }
</script>

<style scoped>
  .event-form-wrapper {
    display: flex;
    flex-direction: column;
    width: 20rem;
  }

  .event-form-item {
    display: flex;
    flex-direction: column;
    margin-bottom: 2rem;
  }
</style>