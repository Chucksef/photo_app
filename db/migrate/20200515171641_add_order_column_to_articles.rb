class AddOrderColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :order, :integer
  end
end
