module Api
  module V1
    class ApiController < ::ActionController::API
      include ApiExceptionHandler
      include ApiResponse
    end
  end
end
