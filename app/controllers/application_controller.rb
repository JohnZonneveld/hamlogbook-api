class ApplicationController < ActionController::API
	before_action :authorized
	attr_reader :current_user
	@@expiry = 3600 # 3600 seconds

	def auth_header
		# { Authorization: 'Bearer <token>' }
		request.headers['Authorization']
	end

	def decoded_token
		# if we can access the token
		if auth_header
			# Disgard the 'Bearer ' part
		  	token = auth_header.split(' ')[1]
		  	# The Begin/Rescue syntax allows us to rescue out of an exception in Ruby.
		  	begin
				# This will decode the payload we originally gave the token
				JsonWebToken.decode(token)
		  	rescue JWT::DecodeError
				# render json: { errors: 'Session has expired! Please log in' }, status: :unauthorized
				nil
		  	end
		end
	end

	def current_user
		# If token can be decoded
		if decoded_token
		  	# Return the user who we gave the token to
			user_id = decoded_token['user_id'] 
		  	user = User.find_by(id: user_id)
		end
	end
  
	def logged_in?
		!!current_user
	end
  
	def authorized
		render json: { errors: 'Session has expired! Please log in' }, status: :unauthorized unless logged_in?
	end

	def exp_time
		# expiration time set to @@expiry from now
		Time.now.to_i + @@expiry
	end

	def payload(user)
		options = {include: [:callsign, :email, :my_qth]}
	  	return nil unless user and user.id
	  	{
			auth_token: JsonWebToken.encode({user_id: user.id}, exp_time),
			user: UserSerializer.new(user)
	  	}
	end
	
end
