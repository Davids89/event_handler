module EventInteractor
  include EventRepository

  def get_month_events(month)
    events = all_events

    events.filter_by_month(month)
  end
end
