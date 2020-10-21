class CreateEventInteractor
  def create_event(params)
    repository = EventRepository.new

    repository.create_event(params)
  end
end
