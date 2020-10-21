class EventsController < ApplicationController
  def show
    interactor = FindEventInteractor.new

    render_show interactor.get_month_events(show_params[:id])
  end

  def create
    interactor = CreateEventInteractor.new

    event = interactor.create_event(create_params)

    if event.valid?
      render_create event
    else
      render_errors event
    end
  end

  def show_params
    params.permit(:id)
  end

  def create_params
    params.require(:data).permit(:title, :description, :start_date, :end_date)
  end
end
