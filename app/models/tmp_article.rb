class TmpArticle < Page
    has_one_attached :image

    validates :heading_1, presence: true, length: { maximum: 50 }
    validates :article_1, presence: true
end