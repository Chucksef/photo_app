class CreateTmpLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :tmp_links do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
