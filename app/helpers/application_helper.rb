module ApplicationHelper

  def current_user
    User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticated?
    if current_user && current_user.authenticate(params[:user][:password])
    end
  end
end
