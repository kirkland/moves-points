class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Helper methods
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.where(moves_user_id: session[:moves_user_id]).first
  end

  def current_user=(user)
    if user
      session[:moves_user_id] = user.moves_user_id
    else
      session.delete :moves_user_id
    end
  end

  def logged_in?
    current_user.present?
  end
end
