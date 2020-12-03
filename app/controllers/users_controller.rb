class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.new(user_params)
        if user.save
            payload_data = {user: user.id}
            # JsonWebToken.encode is defined in lib/json_web_token.rb
            token = JsonWebToken.encode(payload_data, exp_time)
            # payload() is defined in application_controller
			render json: payload(user)
        else
            render json: { errors: user.errors.full_messages }, status: :not_acceptable
        end 
    end

    def show
        user = User.find(:id)
        payload_data = {user: user.id}
        # JsonWebToken.encode is defined in lib/json_web_token.rb
        token = JsonWebToken.encode(payload_data, exp_time)
        # payload() is defined in application_controller
        render json: payload(user)
    end

    def index
        @users = User.all
        render json: UserSerializer.new(@users)
    end

    def update
        user = User.find_by(id: params[:id])
        userdata = params[:user]
        if user
            params[:user].delete(:password) if params[:user][:password].blank?
            if user.update_attributes(user_params)
                response = { message: "User updated successfully"}
                payload_data = {user: user.id}
			    token = JsonWebToken.encode(payload_data, exp_time)
			    render json: payload(user)
            else
                render :json => { :errors => user.errors.full_messages }, :status => 422
            end
        end
    end
    
    
    private
    
    def user_params
        params.require(:user).permit!
    end
end
