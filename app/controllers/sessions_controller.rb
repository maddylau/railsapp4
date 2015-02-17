class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email],params[:password])
    if @user
      flash[:notice] = "You've been logged in"
      session[:user_id] = @user.id
      redirect_to :posts
    else 
      flash[:alert] = "Incorrect email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully. Visit soon!"
    redirect_to '/'
  end
end