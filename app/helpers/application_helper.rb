module ApplicationHelper
  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def signed_in?
    !current_user.nil?
  end
end
