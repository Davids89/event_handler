# rubocop:disable Style/FrozenStringLiteralComment

module ControllerHelpers
  def json
    JSON.parse(response.body, object_class: OpenStruct)
  end

  def json_hash
    JSON.parse(response.body, symbolize_names: true)
  end

  def errors
    json_hash[:errors]
  end

  # delegate to evaluate a property of one object in the context of another original object
  delegate :data, to: :json
end
# rubocop:enable Style/FrozenStringLiteralComment
