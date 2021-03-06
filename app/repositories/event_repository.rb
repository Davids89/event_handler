# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Style/Documentation
class EventRepository
  def find_all
    Event.all
  end

  def create_event(params)
    Event.create(params)
  end

  def update_event(event_id, params)
    event = find_by event_id

    event.update(params)

    event
  end

  def destroy_event(event_id)
    event = find_by event_id

    event.destroy
  end

  def find_by(event_id)
    Event.find(event_id)
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/FrozenStringLiteralComment
