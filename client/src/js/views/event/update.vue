<script>
  import moment from 'moment'

  import FormMixin from './mixin/_form'

  import eventsService from '../../services/eventsService'

  export default {
    mixins: [FormMixin],

    data() {
      return {
        event: this.$route.params.event
      }
    },

    created() {
      this.convertDates()
    },

    methods: {
      submit() {
        eventsService.update(this.event, this.event.id).then(response => {
          this.$router.push({name: 'calendar'})
        })
      },

      convertDates() {
        this.event.startDate = moment(this.event.startDate).format('YYYY-MM-DD')
        this.event.endDate = moment(this.event.endDate).format('YYYY-MM-DD')
      }
    }
  }
</script>