class User < ApplicationRecord
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true
	validates_length_of :password, :minimum => 8

	require 'bcrypt'
	# before_create :encrypt_password
	before_save :encrypt_password
	def encrypt_password
		self.password = BCrypt::Password.create(self.password)
	end
	has_many :comments, dependent: :destroy


	# mount_uploader :image, ImageUploader
end