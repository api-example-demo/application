module ApiExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ApiExceptionHandler::InvalidToken do |e|
      json_response({ status: :unauthorized, message: "invalid token" }, :unauthorized)
    end

    rescue_from ApiExceptionHandler::MissingToken do |e|
      json_response({ status: :unauthorized, message: "missing token" }, :unauthorized)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ status: :not_found, message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ status: :unprocessable_entity, message: e.message }, :unprocessable_entity)
    end
  end
end
