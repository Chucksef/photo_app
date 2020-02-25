class RemoveArticlesAndHeadingsFromPage < ActiveRecord::Migration[5.2]
  def change
    (1..6).to_a.each do |i|
      remove_column :pages, "article_#{i}".to_sym, :text
      remove_column :pages, "heading_#{i}".to_sym, :string
    end
  end
end
