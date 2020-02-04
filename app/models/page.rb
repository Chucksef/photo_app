class Page < SiteItem
    belongs_to :user, optional: true
    
    validates :subtitle, presence: true
end