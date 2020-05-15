class Article < ApplicationRecord
	has_one_attached :image
	
	belongs_to :page, optional: true

	validates :title,			presence: true,
								length: {maximum: 100}
	validates :body,			presence: true,
								length: {maximum: 2000}
	validates :order, 			presence: true
end
