class Gallery < ApplicationRecord
    #has_many :images

    validates :name, presence: true
    validates :name, length: { maximum: 20 }
    validates :description, presence: true
    validates :description, length: { maximum: 200 }
    validates :order, numericality: true
    validates :order, uniqueness: true
    
end
