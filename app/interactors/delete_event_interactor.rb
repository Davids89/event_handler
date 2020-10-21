class DeleteEventInteractor
  def destroy(event_id)
    repository = EventRepository.new

    repository.destroy_event event_id
  end
end