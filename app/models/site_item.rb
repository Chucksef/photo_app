class SiteItem < ApplicationRecord
    belongs_to :site
    
    scope :tmp_groups, -> { where(type: "TmpGroup") }
    scope :pages, -> { where(type: "Page") }

    validates :name,       presence: true,
                            length: { maximum: 25 }
    validates :order,       presence: true, 
                            uniqueness: true
    validates :description, presence: true,
                            length: { maximum: 200 }
end
