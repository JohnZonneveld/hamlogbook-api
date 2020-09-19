class AuthenticationController < ApplicationController
	skip_before_action :authorized, only: [:create]

	def create
		user = User.find_by(callsign: params[:user][:callsign])
		  
		  if user && user.authenticate(params[:user][:password])
			token = encode_token({ user_id: user.id })
			# render json: { user: user, jwt: token }, status: :accepted
			render json: payload(user)
	  	else
			render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
	  	end
	end
  
	private
  
	def payload(user)
		options = {include: [:callsign, :email, :my_qth]}
	  	return nil unless user and user.id
	  	{
			auth_token: JsonWebToken.encode({user_id: user.id}),
			# user: {id: user.id, callsign: user.callsign, email: user.email, my_qth: user.my_qth}
			user: UserSerializer.new(user)
	  	}
	end
end
  