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
		@item = @site.send(set_type.pluralize).new(item_params)

		@item.order = SiteItem.order(order: :asc).last.order + 1
		@item.site_id = 1

		# 10.times { puts }
		# puts "#{@item.class}:\n\nName: #{@item.name}\n\nDescription: #{@item.description}\n\nOrder: #{@item.order}\n\nSite_ID: #{@item.site_id}."
		# 10.times { puts }

		if @item.save
			redirect_to site_item_tmp_groups_path
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

		def item_params
			params.require(set_type.to_sym).permit(:type, :name, :subtitle, :visible, :description, :order, :site_id, :tmp_group_id, :article_1, :article_2, :article_3, :article_4, :article_5, :article_6, :heading_1, :heading_2, :heading_3, :heading_4, :heading_5, :heading_6)
		end
end
