class CreatePages < ActiveRecord::Migration[5.2]
	def change
		create_table :pages do |t|
			# foreign keys
			t.integer :group_id
			
			# common info								SI	Gp	Pg	Tmp	
			t.string :name							#	x	
			t.string :title							#	x				
			t.string :subtitle						#			x				
			t.text :description						#	x				
			t.string :type							#	-					
			t.integer :order						#	x				
			t.boolean :visible, :default => true	#	-				
			t.timestamps							

			# article text
			t.text :article_1						#					
			t.text :article_2						#					
			t.text :article_3						#					
			t.text :article_4						#					
			t.text :article_5						#					
			t.text :article_6						#					

			# heading text
			t.string :heading_1						#					
			t.string :heading_2						#					
			t.string :heading_3						#					
			t.string :heading_4						#					
			t.string :heading_5						#					
			t.string :heading_6						#					

		end
		add_index :pages, [:type, :group_id]
	end
end
