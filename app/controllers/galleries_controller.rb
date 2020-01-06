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

    def create
        @gallery = Gallery.new(gallery_params)

        if @gallery.save
            flash[:success] = "Added #{@gallery.name}!"
            redirect_to @gallery
        else
            render :new
        end
    end

    private def gallery_params
        params.require(:gallery).permit(:name, :description, :visible, :order)
    end

end
