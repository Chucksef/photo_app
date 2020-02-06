class SiteItemsController < ApplicationController
	before_action :get_site
	# before_action :complete_new_item only: [:new]

	def index
		@items = SiteItem.order(order: :asc).all
	end

	def show
		@item = SiteItem.find(params[:id])
	end

	def new
		@item = @site.send(set_type.pluralize).new
	end

	def create
		@item = @site.send(set_type.pluralize).new

		@item.order = SiteItem.order(order: asc).last.order + 1
		@item.site_id = 1

		if @item.save
			redirect_to site_items_index_path
			flash[:success] = "#{params[:type].to_s[3..-1]} Successfully Created"
		else
			render :new
		end
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
