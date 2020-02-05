class RemoveTitleFromSiteItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :site_items, :title, :string
  end
end
