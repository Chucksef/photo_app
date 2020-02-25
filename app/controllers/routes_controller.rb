class RoutesController < ApplicationController

    def root
        puts "\n\n\n\n\n\n\n\n\n\n\n\n\n"
		@item = Page.order(order: :asc).first
		puts "....................#{@item.name}"
        render "pages/root"
    end

end
