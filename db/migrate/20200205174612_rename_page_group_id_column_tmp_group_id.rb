class RenamePageGroupIdColumnTmpGroupId < ActiveRecord::Migration[5.2]
  def change
    remove_column :pages, :group_id, :integer
    
    add_column :pages, :tmp_group_id, :integer
    add_index :pages, :tmp_group_id
  end
end
