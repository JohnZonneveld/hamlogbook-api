class AuthenticationController < ApplicationController
	skip_before_action :authorized, only: [:create]
	exp_time = Time.now.to_i + 120

	def create
		user = User.find_by(callsign: params[:user][:callsign])
		if user && user.authenticate(params[:user][:password])
			# exp_time = Time.now.to_i + 3600 # one hour from now
			payload_data = {user: user.id}
			token = JsonWebToken.encode(payload_data, exp_time)
			render json: payload(user)
		else
			render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
		end
	end

	def hastoken
		# Give them a new token with a new expiry time
		token = JsonWebToken.encode({ user_id: current_user.id }, exp_time)
		render json: { userdata: UserSerializer.new(current_user), jwt: token }, status: :accepted
	end

	def exp_time
		# expiration time set to 10 minutes from now
		Time.now.to_i + 60
	end
  
	private
  
	def payload(user)
		options = {include: [:callsign, :email, :my_qth]}
	  	return nil unless user and user.id
	  	{
			auth_token: JsonWebToken.encode({user_id: user.id}, exp_time),
			user: UserSerializer.new(user)
	  	}
	end
end
  