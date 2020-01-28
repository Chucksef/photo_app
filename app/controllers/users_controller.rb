class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update]
  
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
	@user = User.new(user_params)

	if @user.save
		log_in(@user)
		flash[:success] = "Successfully signed up. Welcome #{@user.name}!"
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

	@user.destroy
	redirect_to users_path
	end

	private 
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		#before filters

		#confirms a logged-in user
		def logged_in_user
			unless logged_in?
				flash[:danger] = "Please Log In"
				redirect_to login_url
			end
		end

end
