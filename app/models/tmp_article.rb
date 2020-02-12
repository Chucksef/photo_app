class TmpArticle < Page
    has_one_attached :image

    validates :article_1,           presence: true,
                                    length: {maximum: 750}
    validates :heading_1,          presence: true,
                                    length: {maximum: 50}
                                    
end