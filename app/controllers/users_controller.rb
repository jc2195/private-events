class UsersController < ApplicationController

  before_action :require_login, only: [:show, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:current_user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find_by_id(session[:current_user_id])
  end

  def index
    redirect_to user_path(session[:current_user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end

  def require_login
    unless signed_in?
      redirect_to new_session_url
    end
  end
end
