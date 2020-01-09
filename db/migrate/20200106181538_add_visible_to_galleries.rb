class AddVisibleToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :visible, :boolean
  end
end
