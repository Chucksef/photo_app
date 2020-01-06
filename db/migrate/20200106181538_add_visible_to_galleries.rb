class AddVisibleToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :visible, :boolean
    add_column :galleries, :order, :integer
    add_index :galleries, :order, unique: true
  end
end
