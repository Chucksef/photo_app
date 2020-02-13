class SiteItemsController < ApplicationController
	before_action :check_admin, except: [:show]
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
		@item.articles.build if @item.type == "TmpArticle"
		@groups = TmpGroup.order(order: :asc).all
	end

	def create
		@item = @site.send(set_type.pluralize).new(item_params)

		@item.order = SiteItem.order(order: :asc).last.order + 1
		@item.site_id = 1

		if @item.save
			redirect_to site_items_path
			flash[:success] = "#{params[:type].to_s[3..-1]} Successfully Created"
		else
			render :new
		end
	end

	def edit
		@item = SiteItem.find(params[:id])
		
		@groups = TmpGroup.order(order: :asc).all
	end

	def update
		@item = SiteItem.find(params[:id])

		if @item.update(item_params)
			flash[:success] = "#{params[:type].to_s[3..-1]} Successfully Updated"
			redirect_to site_items_path
		else
			render :edit
		end
	end

	def destroy
		@item = SiteItem.find(params[:id])
		
		if SiteItem.all.count > 1

			destroy_all_images(@item)
			flash[:success] = "Deleted #{@item.name} Successfully"
			@item.destroy
			redirect_to site_items_path
		else
			flash[:danger] = "Website must always have at least 1 page. Add a new page before trying again."
			redirect_to site_items_path
		end

	end

	def delete_image_attachment
		@image = ActiveStorage::Blob.find_signed(params[:id])
        @image.attachments.first.purge
		redirect_to edit_site_item_path(params[:format])
	end


	private

		def check_admin
			unless user_admin?
				flash[:danger] = "Only Admins may make changes to the website"
				redirect_to root_url
			end
		end

		def get_site
			@site = Site.first
		end

		def destroy_all_images(item)
			case item.type
			when "TmpGallery"
				@attached_images = item.images.all
				@attached_images.each do |image|
					image.purge
				end
			end
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
			params.require(set_type.to_sym).permit(	:type, :name, :subtitle, :visible, :description, :order, :site_id, :tmp_group_id, images: [], articles_attributes: [:id, :title, :body, :site_item_id, :created_at, :updated_at, :_destroy, :image])
		end
end
