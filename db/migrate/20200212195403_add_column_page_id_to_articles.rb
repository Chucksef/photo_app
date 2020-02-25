class AddColumnPageIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :page_id, :integer
  end
end
