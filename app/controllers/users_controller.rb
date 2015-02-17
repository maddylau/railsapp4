class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @post = @user.posts
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to blogging!"
      redirect_to :posts
    else
      flash[:alert] = "Try again!"
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end