class ApplicationController < ActionController::Base
    before_action :get_galleries

    private def get_galleries
        @galleries = Gallery.all
    end
end
