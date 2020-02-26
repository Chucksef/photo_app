class Site < ApplicationRecord
    has_one_attached :logo

    has_many :pages
    has_many :tmp_articles, class_name: "TmpArticle"
    has_many :tmp_galleries, class_name: "TmpGallery"
    has_many :tmp_cards, class_name: "TmpCard"
    has_many :tmp_groups, class_name: "TmpGroup"
    has_many :tmp_splashes, class_name: "TmpSplash"

    validates :name,    presence: true,
                        length: {maximum: 50}
end
