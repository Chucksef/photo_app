class TmpItem < Page
    has_many_attached :images

    validates :heading_1, presence: true
    validates :article_1, presence: true

end