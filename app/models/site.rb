class Site < ApplicationRecord
    has_many :site_items
    has_many :tmp_articles, class_name: "TmpArticle"
    has_many :tmp_galleries, class_name: "TmpGallery"
    has_many :tmp_cards, class_name: "TmpCard"
    has_many :tmp_groups, class_name: "TmpGroup"

    validates :name,    presence: true
end
