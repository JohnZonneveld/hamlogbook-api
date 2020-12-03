class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.new(user_params)
        if user.save
            render json: {
				auth_token: JsonWebToken.encode({user_id: user.id}, exp_time),
				user: UserSerializer.new(user),
				success: "User created succesfully"
		  	}
        else
            byebug
            render json: { 
                errors: user.errors.full_messages 
            }, status: :not_acceptable
        end 
    end

    def update
        user = User.find_by(id: params[:id])
        userdata = params[:user]
        if user
            params[:user].delete(:password) if params[:user][:password].blank?
            if user.update_attributes(user_params)
                render :json => {
                    auth_token: JsonWebToken.encode({user_id: user.id}, exp_time),
                    user: UserSerializer.new(user),
                    success: "Profile updated succesfully"
                }
            else
                render :json => { 
                    errors: user.errors.full_messages 
                }, :status => 422
            end
        end
    end
    
    
    private
    
    def user_params
        params.require(:user).permit!
    end
end
