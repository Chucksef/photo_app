class RemoveColumn < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :galleries, :order
  end
end
