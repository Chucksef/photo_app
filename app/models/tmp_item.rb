class TmpCard < Page
    has_many_attached :images

    validates :heading_1, presence: true, length: { maximum: 25 }
    validates :article_1, presence: true

end