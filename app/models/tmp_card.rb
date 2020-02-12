class TmpCard < Page
    has_many_attached :images

    validates :article_1,           presence: true,
                                    length: {maximum: 400}
    validates :heading_1,          presence: true,
                                    length: {maximum: 50}
end