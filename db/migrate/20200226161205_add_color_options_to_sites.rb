class AddColorOptionsToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :primary_color, :string
    add_column :sites, :navbar_color, :string
  end
end
