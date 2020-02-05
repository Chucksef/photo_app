class CreateSites < ActiveRecord::Migration[5.2]
  def change
    add_column :site_items, :site_id, :integer
    create_table :sites do |t|

      t.timestamps
    end
  end
end
