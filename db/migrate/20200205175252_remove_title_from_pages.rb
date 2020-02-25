class RemoveTitleFromPages < ActiveRecord::Migration[5.2]
  def change
    remove_column :pages, :title, :string
  end
end
