class SessionsController < ApplicationController
  def create
    session[:user] = auth_hash['uid']

    redirect_to :people
  end

  def failed; end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
