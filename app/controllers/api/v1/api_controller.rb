module Api
  module V1
    class ApiController < ::ActionController::API
      before_action :authenticate_request

      include ApiExceptionHandler
      include ApiResponse

      private

      def authenticate_request
        raise ApiExceptionHandler::MissingToken if http_auth_header.nil?

        user = User.where(token: http_auth_header).first

        raise ApiExceptionHandler::InvalidToken if user.nil?
      end

      def http_auth_header
        return request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?

        nil
      end
    end
  end
end
