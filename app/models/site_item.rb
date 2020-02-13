class SiteItem < ApplicationRecord

    belongs_to :site
    has_many :articles, dependent: :destroy
    accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: proc { |att| att['title'].blank?}
    
    scope :tmp_groups, -> { where(type: "TmpGroup") }
    scope :tmp_articles, -> { where(type: "TmpArticle") }
    scope :tmp_galleries, -> { where(type: "TmpGallery") }
    scope :tmp_cards, -> { where(type: "TmpCard") }

    #scope :pages, -> { where(type: "Page") }

    validates :name,        presence: true,
                            length: { maximum: 25 }
    validates :order,       presence: true, 
                            uniqueness: true
    validates :description, presence: true,
                            length: { maximum: 200 }
end
