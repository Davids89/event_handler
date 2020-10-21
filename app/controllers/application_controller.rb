class ApplicationController < ActionController::API
  def render_show(item, representation=:basic)
    render_item item, representation, 200
  end

  def render_create(item, representation=:basic)
    render_item item, representation, 201
  end

  def render_errors(item)
    render json: {errors: item.errors.details}, status: 422
  end

  def render_item(item, representation, status)
    render json: {data: item.representation(representation), status: status}
  end
end
