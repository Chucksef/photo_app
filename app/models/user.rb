class User < ApplicationRecord
	attr_accessor :remember_token

	before_save { self.email = email.downcase}

	validates   :name, 
					presence: true,
					length: { maximum: 50 }
	validates	:email,
					presence: true,
					length: { maximum: 200 },
					format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
					uniqueness: { case_sensitive: false }
	validates	:password,
					presence: true,
					length: { minimum: 6 }

	has_secure_password

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													  BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# returns a random token
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end
	
	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
	
end