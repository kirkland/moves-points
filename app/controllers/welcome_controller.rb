class WelcomeController < ApplicationController
  def index
    unless logged_in?
      redirect_to '/auth/moves' and return
    end

    @user = current_user
  end
end
