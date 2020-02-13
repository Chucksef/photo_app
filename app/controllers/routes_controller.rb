class RoutesController < ApplicationController

    def root
        redirect_to site_item_path(SiteItem.order(order: :asc).all.first)
    end

end
