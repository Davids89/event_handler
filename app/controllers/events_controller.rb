class EventsController < ApplicationController
  def show
    interactor = EventInteractor.new

    render_show interactor.get_month_events(params_show[:id])
  end

  def params_show
    params.permit(:id)
  end
end
