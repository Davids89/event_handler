# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Style/Documentation
class CreateEventInteractor
  def create_event(params)
    repository = EventRepository.new

    repository.create_event(params)
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/FrozenStringLiteralComment
