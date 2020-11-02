import Vue from 'vue'
const path = 'events'

export default {
  async show(id) {
    const response = await Vue.http.get(`${path}/${id}`)

    return response.data.data
  },

  async delete(id) {
    const response = await Vue.http.delete(`${path}/${id}`)

    return response.data
  }
}