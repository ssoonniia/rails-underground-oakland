class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && authenticated?(@user)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
