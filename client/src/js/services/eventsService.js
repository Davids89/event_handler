import Vue from 'vue'
const path = 'events'

export default {
  async show(id) {
    const response = await Vue.http.get(`${path}/${id}`)

    return response.data.data
  }
}