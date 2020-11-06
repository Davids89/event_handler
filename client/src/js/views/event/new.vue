<script>
  import moment from 'moment'

  import FormMixin from './mixin/_form'

  import eventsService from '../../services/eventsService'

  export default {
    mixins: [FormMixin],

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
      submit() {
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