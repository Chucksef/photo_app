class Page < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    before_save :downcase_slug

    belongs_to :site
    has_many :articles, dependent: :destroy
    accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: proc { |att| att['title'].blank?}
    

    scope :tmp_groups, -> { where(type: "TmpGroup") }
    scope :tmp_articles, -> { where(type: "TmpArticle") }
    scope :tmp_galleries, -> { where(type: "TmpGallery") }
    scope :tmp_cards, -> { where(type: "TmpCard") }
    scope :tmp_splashes, -> { where(type: "TmpSplash") }

    #scope :pages, -> { where(type: "Page") }

    validates :name,        presence: true,
                            length: { maximum: 40 }
    validates :order,       presence: true, 
                            uniqueness: true
    validates :description, presence: true,
                            length: { maximum: 50 }
    validates :slug,        presence: true,
                            format: { with: /\A[a-zA-Z0-9-]+\z/, message: "Must only contain letters, numbers, and hyphens" },
                            uniqueness: true

    private

        def downcase_slug
            self.slug.downcase!
        end
end
