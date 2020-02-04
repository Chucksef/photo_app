class Group < SiteItem
    has_many :pages, class_name: "Page"
end