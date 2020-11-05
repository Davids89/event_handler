import Vue from 'vue'
const path = 'events'

export default {
  async show(id) {
    const response = await Vue.http.get(`${path}/${id}`)

    return response.data.data
  },

  async create(data) {
    try {
      const response = await Vue.http.post(path, {data})

      return response.data.data
    } catch (e) {
      if (e.status === 422) {
        throw e.data.errors
      }

      throw e
    }
  },

  async update(data, id) {
    try {
      const response = await Vue.http.put(`${path}/${id}`, {data})

      return response.data.data
    } catch (e) {
      if (e.status = 422) {
        throw e.data.errors
      }

      throw e
    }
  },

  async delete(id) {
    const response = await Vue.http.delete(`${path}/${id}`)

    return response.data
  }
}