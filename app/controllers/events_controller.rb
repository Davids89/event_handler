class EventsController < ApplicationController
  include EventInteractor

  def show
    render_show get_month_events(params_show[:id])
  end

  def params_show
    params.permit(:id)
  end
end
