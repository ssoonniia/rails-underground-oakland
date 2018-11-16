class UsersController < ApplicationController
  before_action :logged_in?, only: [:show, :edit]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :profile_owner?, only: [:show, :edit, :update]


  def new
    @user = User.new
    render :layout => "home"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to user_path(@user)
    else
      render :new, :layout => "home"
    end
  end

  def show
    @rsvps = @user.rsvps
    @user_events = user_events
    respond_to do |format|
      format.html
      format.json {render :json => @user}
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def profile_owner?
    if current_user.id == params[:id].to_i
      true
    else
      flash[:danger] = 'Woops - that isn\'t your profile'
      redirect_to events_path
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

end
