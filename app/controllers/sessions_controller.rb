class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by_username(params[:username])
    session[:current_user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def destroy
    reset_session
    redirect_to users_path
  end

end
