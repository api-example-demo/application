class IndexController < ApplicationController
  def show
    @current_user = current_user

    redirect_to :people
  end
end
