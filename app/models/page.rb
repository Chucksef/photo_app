class Page < SiteItem
    belongs_to :tmp_group, optional: true
    
    # validates :subtitle, presence: true, length: { maximum: 75 }
end