class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    session[:user]
  end

  def logged_in?
    current_user.present?
  end

  def authorized
    redirect_to '/auth/google_oauth2' unless logged_in?
    @api_key = ENV['API_KEY']
  end
end
