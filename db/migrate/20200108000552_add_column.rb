class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :count, :integer
  end
end
