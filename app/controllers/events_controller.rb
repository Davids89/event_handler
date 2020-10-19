class EventsController < ApplicationController
  include EventInteractor

  def show
    render_show get_month_events(params[:id])
  end
end
