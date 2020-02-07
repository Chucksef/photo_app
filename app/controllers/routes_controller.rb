class RoutesController < ApplicationController

    def root
        redirect_to site_item_path(SiteItem.find_by(order: 1))
    end

end
