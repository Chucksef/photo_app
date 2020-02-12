class TmpCard < Page
    has_many_attached :images
    has_many :articles
    
end