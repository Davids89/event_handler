class EventRepository
  def find_all
    Event.all
  end

  def create_event(params)
    Event.create(params)
  end
end
