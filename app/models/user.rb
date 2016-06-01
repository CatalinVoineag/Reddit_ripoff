class User < ActiveRecord::Base
	
	before_save { self.email = email.downcase }

	validates :name, presence: true, length: { in: 1..50 }
	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	has_secure_password

	attr_accessor :remember_token

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns a hash digest of the given string
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
																								 BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# Returns a random token
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Returns true if the given token matches the digest
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(:remember_token)
	end

	# Forgets a user
	def forget
		update_attribute(:remember_token, nil)
	end

end
