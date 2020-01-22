class User < ApplicationRecord

	validates                   :name, 
									presence: true,
									length: { maximum: 50 }
	validates                   :email,
									presence: true,
									length: { maximum: 200 },
									format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
									uniqueness: { case_sensitive: false }
	validates                   :password, presence: true, length: { minimum: 8 }
	validates					:password_confirmation, presence: true
	validates_confirmation_of	:password


end
