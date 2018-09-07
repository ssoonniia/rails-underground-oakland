class UsersController < ApplicationController
  before_action :logged_in?, only: [:show, :edit]
  before_action :set_user, only: [:show, :edit, :update]


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

  def profile_owner
    current_user.id == params[:id]
  end

end
