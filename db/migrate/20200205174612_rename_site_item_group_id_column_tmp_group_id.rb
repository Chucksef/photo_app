class RenameSiteItemGroupIdColumnTmpGroupId < ActiveRecord::Migration[5.2]
  def change
    remove_column :site_items, :group_id, :integer
    
    add_column :site_items, :tmp_group_id, :integer
    add_index :site_items, :tmp_group_id
  end
end
