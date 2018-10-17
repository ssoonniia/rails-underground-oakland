class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    if !set_user
      render :layout => "home"
    else
    redirect_to events_path
    end  
  end

private

  def current_user
    User.find_by_id(session[:user_id])
  end

  def set_user
    @user =  User.find_by_id(session[:user_id])
  end

  def logged_in?
    if !session[:user_id]
      flash[:danger] = 'Woops! Please login or sign  up first'
      redirect_to root_path
    else
      true
    end
  end

  def authenticated?(user)
    user.authenticate(params[:user][:password])
  end

  def owner?
    @event = Event.find_by_id(params[:id])
    if @event.user_id == current_user.id
      true
    end
  end

end
