class RoutesController < ApplicationController

    def root
        redirect_to page_path(Page.order(order: :asc).all.first)
    end

end
