class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def new
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
  	session[:user_id] = @user.id
  	redirect_to 'widgets#index'
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
