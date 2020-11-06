# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Style/Documentation
class FindEventInteractor
  def get_month_events(month)
    repository = EventRepository.new

    events = repository.find_all

    events.filter_by_month(month)
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/FrozenStringLiteralComment
