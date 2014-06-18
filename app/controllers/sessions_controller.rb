class SessionsController < ApplicationController
  def create
    user = User.where(moves_user_id: auth_hash['uid'].to_s).first_or_create
    user.oauth_tokens.create_from_auth_hash auth_hash
    @current_user = user
    redirect_to '/'
  end

  def destroy
    self.current_user = nil
    redirect_to '/'
  end

  protected

  def access_token
    auth_hash['credentials']['token']
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def refresh_token
    auth_hash['credentials']['refresh_token']
  end
end
