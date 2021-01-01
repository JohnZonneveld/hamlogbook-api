class User < ApplicationRecord
	#Validations
	validates_presence_of :callsign, :email, :password_digest, :my_qth
	validates :callsign, :email, uniqueness: true
	validates_format_of :my_qth, with: /\A([A-R]{2}[0-9]{2})\z|\A([A-R]{2}[0-9]{2}[a-x]{2})\z|\A([A-R]{2}[0-9]{2}[a-x]{2}[0-9]{2})\z/, on: [:create, :update]
	# After vaidation remove password_digest error message
	after_validation { self.errors.messages.delete(:password_digest) }
	  
	#encrypt password
	has_secure_password

	has_many :contacts
end
