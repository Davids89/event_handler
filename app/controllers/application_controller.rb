class ApplicationController < ActionController::API
  def render_show(item, representation=:basic)
    render_item item, representation, 200
  end

  def render_item(item, representation, status)
    render json: {data: item.representation(representation), status: status}
  end
end
