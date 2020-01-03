module ApplicationHelper
    def get_page_title(page_title = '')
        base_title = "Photo DB"
        if page_title.empty?
          base_title
        else
          page_title + " | " + base_title
        end
      end
end
