class Article < ApplicationRecord
	has_one_attached :image
	belongs_to :page

	validates :title,			presence: true,
								length: {maximum: 50}
	validates :body,			presence: true,
								length: {maximum: 750}
end
