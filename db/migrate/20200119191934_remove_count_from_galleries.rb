class RemoveCountFromGalleries < ActiveRecord::Migration[5.2]
  def change
    remove_column :galleries, :count, :integer
  end
end
