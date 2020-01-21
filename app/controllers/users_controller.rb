class UsersController < ApplicationController
  def index
      @users = User.all
  end

  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
  end

  def show
      @user = User.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(user_params)
  end

  def destroy
      @user = User.find(params[:id])
  end

  private def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
