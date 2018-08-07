module ApplicationHelper

  def current_user
    User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
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
    Event.all.map do |event|
      event.user_id == @user.id
        event
    end
  end
end
