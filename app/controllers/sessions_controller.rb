class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def new
  end

  def create
    org_id = auth_hash['extra']['org_id']
    if org_id == "1"
      @user = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = @user.id
      redirect_to root_url
    else
      log_out
      render 'new'
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
