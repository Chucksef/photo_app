class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update]
	before_action :correct_user, only: [:edit, :update]
  
	def index
		@users = User.paginate(page: params[:page])
	end

	def new
		@user = User.new
	end

	def create
	@user = User.new(user_params)

		if @user.save
			UserMailer.account_activation(@user).deliver_now
			flash[:success] = "Successfully Sent Activation Email to #{@user.email}"
			redirect_to root_url
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
				store_location
				flash[:danger] = "Please Log In"
				redirect_to login_url
			end
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user) || user_admin?
		end

end
