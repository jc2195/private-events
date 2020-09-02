class UsersController < ApplicationController

  before_action :require_login, except: [:index, :new, :create]

  def new
    @user = User.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "That username already exists!"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(session[:current_user_id])
  end

  def index
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
