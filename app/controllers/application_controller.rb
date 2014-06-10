class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.where(moves_user_id: session[:moves_user_id]).first
  end

  def current_user=(user)
    session[:moves_user_id] = user.moves_user_id
  end
end
