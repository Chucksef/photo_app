class SitesController < ApplicationController
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
			params.require(:site).permit(:name)
		end
end