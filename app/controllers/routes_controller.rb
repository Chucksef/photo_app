class RoutesController < ApplicationController

    def root
		@item = Page.order(order: :asc).first
        render "pages/root"
    end
end
