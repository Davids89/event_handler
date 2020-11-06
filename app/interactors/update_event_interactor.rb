# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Style/Documentation
class UpdateEventInteractor
  def update(event_id, params)
    repository = EventRepository.new

    repository.update_event(event_id, params)
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/FrozenStringLiteralComment
