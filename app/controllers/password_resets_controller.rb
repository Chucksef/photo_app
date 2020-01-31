class PasswordResetsController < ApplicationController
	before_action :get_user,   only: [:edit, :update]
	before_action :valid_user, only: [:edit, :update]
	
	def new
	end

	def create
		@user = User.find_by(email: params[:password_reset][:email].downcase)

		if @user
			@user.create_reset_digest
			@user.send_password_reset_email
			flash[:info] = "Email Sent to #{@user.email} with Password Reset Instructions."
			redirect_to root_url
		else
			flash.now[:danger] = "No User by that Email Address."
			render :new
		end
	end

	def edit
		
	end

	def update

	end

	private
		
		def get_user
			@user = User.find_by(email: params[:email])
		end

		def valid_user
			redirect_to root_url unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
		end
end
