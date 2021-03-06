class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_token
  helper_method :logged_in?
  helper_method :gcp_token

  def current_user
    session[:user_id]
  end

  def user_token
    session[:user_token]
  end

  def gcp_token
    ENV['OPENID_API_KEY']
  end

  def logged_in?
    current_user.present?
  end

  def authorized
    redirect_to '/auth/google_oauth2' unless logged_in?
  end
end
