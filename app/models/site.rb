class Site < ApplicationRecord
    has_one_attached :logo

    has_many :pages
    has_many :tmp_articles, class_name: "TmpArticle"
    has_many :tmp_galleries, class_name: "TmpGallery"
    has_many :tmp_cards, class_name: "TmpCard"
    has_many :tmp_groups, class_name: "TmpGroup"
    has_many :tmp_splashes, class_name: "TmpSplash"
    has_many :tmp_links, class_name: "TmpLink"

    validates :name,                presence: true,
                                    length: {maximum: 50}
    validates :primary_color,       format: {with: /\A#[a-f0-9]{6}\z/, message: "Primary Color must take the hex format: #000000" }
    validates :navbar_color,       format: {with: /\A#[a-f0-9]{6}\z/, message: "Navbar Color must take the hex format: #000000" }
end
