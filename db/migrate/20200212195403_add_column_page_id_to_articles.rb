class AddColumnPageIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :site_item_id, :integer
  end
end
