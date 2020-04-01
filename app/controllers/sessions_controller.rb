class SessionsController < ApplicationController
  def create
    @user = User.where(email: auth_hash["info"]["email"]).first_or_initialize
    @user.update(token: SecureRandom.uuid) unless @user.persisted?

    session[:user_id] = @user.id
    session[:user_token] = @user.token

    redirect_to :people
  end

  def failed; end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
