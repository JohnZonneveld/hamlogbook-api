class AuthenticationController < ApplicationController
	skip_before_action :authorized, only: [:create]
	
	def create
		user = User.find_by(callsign: params[:user][:callsign])
		if user
			if user.authenticate(params[:user][:password])
				render json: {
					auth_token: JsonWebToken.encode({user_id: user.id}, exp_time),
					user: UserSerializer.new(user)
				}, status: :accepted
			else
				render json: {error: ["Invalid Password"]}, status: :unauthorized
			end
		else
			render json: {error: ["User unknown, please register first!"]}, status: :unauthorized
		end
	end

	def hastoken
		# Give them a new token with a new expiry time
		token = JsonWebToken.encode({ user_id: current_user.id }, exp_time)
		render json: { userdata: UserSerializer.new(current_user), auth_token: token }, status: :accepted
	end
	
end
  