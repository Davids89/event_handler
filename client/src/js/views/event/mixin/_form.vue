<template>
  <div class="form-view">
    <div class="event-form-wrapper">
      <div class="event-form-item">
        <span> {{ $t('calendar.create.form.eventTitle.label') }} </span>
        <input
          v-model="event.title"
          type="text"
          :placeholder="$t('calendar.create.form.eventTitle.placeholder')"
        >
      </div>
      <div class="event-form-item">
        <span> {{ $t('calendar.create.form.startDate') }} </span>
        <input
          v-model="event.startDate"
          type="date"
        >
      </div>
      <div class="event-form-item">
        <span> {{ $t('calendar.create.form.endDate') }} </span>
        <input
          v-model="event.endDate"
          type="date"
        >
      </div>
      <div class="event-form-item">
        <span> {{ $t('calendar.create.form.description') }} </span>
        <input
          v-model="event.description"
          type="text"
        >
      </div>

      <button @click="submit"> {{$t('calendar.create.button')}} </button>
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