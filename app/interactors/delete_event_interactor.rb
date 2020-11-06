# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Style/Documentation
class DeleteEventInteractor
  def destroy(event_id)
    repository = EventRepository.new

    repository.destroy_event event_id
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/FrozenStringLiteralComment
