class WelcomeController < ApplicationController
  def index
    unless logged_in?
      redirect_to logged_out_path and return
    end

    @user = current_user
    @user.update_data
  end

  def logged_out
  end
end
