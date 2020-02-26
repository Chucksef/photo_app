class SitesController < ApplicationController
	before_action :allow_user

	def edit
		@site = Site.first
	end

	def update
		@site = Site.first

		if @site.update(site_params)
			flash[:success] = "Successfuly Changed Site Name!"
			redirect_to root_path
		else
			render :edit
		end
	end

	private
		def site_params
			params.require(:site).permit(:name, :primary_color, :navbar_color)
		end

		def allow_user
			unless user_admin?
				flash[:danger] = "Must be logged in as an Admin to edit Site Options"
				redirect_to(root_url)
			end
		end

end