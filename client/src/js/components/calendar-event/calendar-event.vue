<template>
  <div class="calendar-event">
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

    <button @click="updateEvent()"> {{ $t('calendar.event.update') }} </button>
    <button @click="deleteEvent(event.id)"> {{ $t('calendar.event.delete') }} </button>
  </div>
</template>

<script>
import Vue from 'vue'

export default {
  props: {
    event: Object
  },

  methods: {
    deleteEvent(id) {
      this.$emit('deleteEvent', id)
    },

    updateEvent() {
      this.$router.push({name: 'EventUpdate', params: {event: this.event, id: this.event.id}})
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