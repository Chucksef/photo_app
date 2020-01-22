class UsersController < ApplicationController
  def index
      @users = User.all
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
        flash[:success] = "Added #{@user.name}!"
        redirect_to @user
    else
        render :new
    end
  end

  def show
      @user = User.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
        flash[:success] = "Updated #{@user.name}!"
        redirect_to @user
    else
        render :edit
    end
  end

  def destroy
      @user = User.find(params[:id])
  end

  private def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

end
