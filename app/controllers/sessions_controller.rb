class SessionsController < ApplicationController

  def new
    @user = User.new
    render :layout => "home"
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if !@user || !authenticated?(@user)
      flash[:message] = 'Oh oh - please check your username and password'
      redirect_to login_path
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def create_with_google
    @user = User.find_or_create_by(auth['uid']) do |u|
     u.name = auth['info']['name']
     u.email = auth['info']['email']
   end
   session[:user_id] = @user.id
   redirect_to user_path(@user)
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def auth
   request.env['omniauth.auth']
  end

end
