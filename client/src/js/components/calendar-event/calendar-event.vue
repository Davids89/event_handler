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

    <button @click="deleteEvent(event.id)">Delete</button>
  </div>
</template>

<script>
export default {
  props: {
    event: Object
  },

  methods: {
    deleteEvent(id) {
      this.$emit('deleteEvent', id)
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