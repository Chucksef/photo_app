class RemoveArticlesAndHeadingsFromSiteItem < ActiveRecord::Migration[5.2]
  def change
    (1..6).to_a.each do |i|
      remove_column :site_items, "article_#{i}".to_sym, :text
      remove_column :site_items, "heading_#{i}".to_sym, :string
    end
  end
end
