module ControllerHelpers
  def json
    JSON.parse(response.body, object_class: OpenStruct)
  end

  # delegate to evaluate a property of one object in the context of another original object
  delegate :data, to: :json
end
