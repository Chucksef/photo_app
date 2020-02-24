class AddSlugToSiteItems < ActiveRecord::Migration[5.2]
  def change
    add_column :site_items, :slug, :string
    add_index :site_items, :slug, unique: true
  end
end
