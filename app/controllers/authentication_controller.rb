class AuthenticationController < ApplicationController
	skip_before_action :authorized, only: [:create]
	
	def create
		byebug
	  	user = User.find_by(callsign: params[:callsign])
		  if user && user.authenticate(params[:password])
			token = encode_token({ user_id: user.id })
			render json: { userdata: user, jwt: token }, status: :accepted
			# render json: payload(user)
	  	else
			render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
	  	end
	end
  
	private
  
	def payload(user)
	  	return nil unless user and user.id
	  	{
			auth_token: JsonWebToken.encode({user_id: user.id}),
			user: {id: user.id, callsign: user.callsign}
	  	}
	end
end
  