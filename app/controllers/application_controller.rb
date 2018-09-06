class ApplicationController < ActionController::Base

  def home
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
      flash[:message] = 'Woops! Please login or sign  up first'
      redirect_to root_path
    end
  end

  def authenticated?(user)
    user.authenticate(params[:user][:password])
  end

  def owner?
    @event = Event.find_by_id(params[:id])
    if @event.user_id = current_user.id
      true
    end
  end



  def user_events
    @user = current_user
    user_created_events = []
    Event.all.each do |event|
      if event.user_id == @user.id
        user_created_events << event
      end
    end
    user_created_events
  end

  def authorized_to_edit?
     if !logged_in? || !owner?
          flash[:message] = 'You are not authorized to edit'
        redirect_to events_path
        end
  end

end
