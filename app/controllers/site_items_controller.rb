class SiteItemsController < ApplicationController
	before_action :get_site

	def index
		@items = SiteItem.order(order: :asc).all
	end

	def show
		@item = SiteItem.find(params[:id])
	end

	def new
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
			when "TmpGroup"
				"tmp_group"
			when "TmpArticle"
				"tmp_article"
			when "TmpGallery"
				"tmp_gallery"
			when "TmpCard"
				"tmp_card"
			end
		end
end
