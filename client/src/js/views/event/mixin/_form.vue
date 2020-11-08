<template>
  <div class="form-view">
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

      <button @click="submit">Create event</button>
    </div>
  </div>
</template>

<style scoped>
  .form-view {
    display: flex;
    justify-content: center;
  }

  .event-form-wrapper {
    margin-top: 3rem;
    display: flex;
    flex-direction: column;
    width: 20rem;
  }

  .event-form-item {
    display: flex;
    flex-direction: column;
    margin-bottom: 2rem;
  }

  .event-form-item input {
    border: 0;
    outline: none;
    background-color:#f5f5ef;
    height: 2rem;
    border-radius: 0.3rem;
  }
</style>