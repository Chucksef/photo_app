class SiteItem < ApplicationRecord
    scope :groups, -> { where(type: "Group") }
    scope :pages, -> { where(type: "Page") }

    validates :name,        presence: true,
                            length: { maximum: 20 }
    validates :title,       presence: true,
                            length: { maximum: 20 }
    validates :order,       presence: true, 
                            uniqueness: true
    validates :description, presence: true,
                            length: { maximum: 200 }
end
