class ApplicationController < ActionController::API
	before_action :authorized

	attr_reader :current_user

	# the token to be given to a user upon successful signup/login
	def encode_token(payload)
		# byebug
		JWT.encode(payload, ENV["JWT_SECRET"], 'HS256')
		# JWT.decode(token, ENV["JWT_SECRET"], true, {algorithm: "HS256"})
	end

	# Since token is sent back in a header this is how we access the token
	def auth_header
		# { Authorization: 'Bearer <token>' }
		request.headers['Authorization']
	end

	def decoded_token
		# byebug
		# if we can access the token
		if auth_header
			byebug
		  	token = auth_header.split(' ')[1]
		  	# header: { 'Authorization': 'Bearer <token>' }
		  	# The Begin/Rescue syntax allows us to rescue out of an exception in Ruby.
		  	begin
				# This will decode the payload we originally gave the token
				JsonWebToken.decode(token)
		  	rescue JWT::DecodeError
				render json: { errors: 'Session has expired! Please log in' }, status: :unauthorized
		  	end
		end
	end

	def current_user
		byebug
		# If we were able to decode the token
		if decoded_token
		  	# Return the user who we gave the token to
			user_id = decoded_token['user_id'] 
		  	@user = User.find_by(id: user_id)
		end
	end
  
	def logged_in?
		byebug
		!!current_user
	end
  
	def authorized
		byebug
		render json: { errors: 'Please log in' }, status: :unauthorized unless logged_in?
	end

	def exp_time
		# expiration time set to 10 minutes from now
		Time.now.to_i + 600
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
