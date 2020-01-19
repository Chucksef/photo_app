class GalleriesController < ApplicationController

    def index
        @galleries = Gallery.all
    end

    def show
        @gallery = Gallery.find(params[:id])
    end

    def new
        @gallery = Gallery.new
    end
        
    def edit
        @gallery = Gallery.find(params[:id])
        
    end
    
    def update
        puts "params ^^^"

        @gallery = Gallery.find(params[:id])
        @attached_images = @gallery.images.all
    
        @attached_images.each_with_index do |img, idx|
            puts "filename #{idx}: #{img.filename}"
        end
        
        if @gallery.update(gallery_params)
            flash[:success] = "Updated #{@gallery.name}!"
            redirect_to @gallery
        else
            render :edit
        end
    end

    def create
        @gallery = Gallery.new(gallery_params)

        if @gallery.save
            flash[:success] = "Added #{@gallery.name}!"
            redirect_to @gallery
        else
            render :new
        end
    end

    def delete_image_attachment
        @image = ActiveStorage::Blob.find_signed(params[:id])
        @image.attachments.first.purge

        redirect_to edit_gallery_path(params[:format])
    end

    def move_image_attachment
        @image = ActiveStorage::Blob.find_signed(parmas[:id]).attachments.first
    end
        

    def destroy
        Gallery.find(params[:id]).destroy
        # Clears out SQLite3 db usage
        redirect_to galleries_path
    end

    private def gallery_params
        params.require(:gallery).permit(:name, :description, :visible, images: [])
    end

end
