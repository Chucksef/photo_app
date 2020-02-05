class SiteItemsController < ApplicationController
	before_action :get_site

	def index
		@items = SiteItem.order(order: :asc).all
	end

	def show
		@item = SiteItem.find(params[:id])
	end

	def new
		puts "THIS IS THE SITE: #{@site}"
		@item = @site.send(set_type.pluralize).new
	end

	def save
		
	end

	private

		def get_site
			@site = Site.first
		end

		def set_type
			case params[:type]
			when "Group"
				"Group"
			when "TmpArticle"
				"TmpArticle"
			when "TmpGallery"
				"TmpGallery"
			when "TmpItem"
				"TmpItem"
			end
		end
end
