class User < ApplicationRecord
	#Validations
	validates_presence_of :callsign, :email, :password_digest, :my_qth
	validates :email, uniqueness: true
	validates_format_of :my_qth, with: /[A-Z]{2}[0-9]{2}[a-z]{2}/, on: :create
	  
	#encrypt password
	has_secure_password
end
