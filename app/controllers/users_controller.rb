class UsersController < ApplicationController
    def create
        @user = User.create(user_params(params(:callsign, :password, :email, :my_qth)))
        if @user.save
            response = { message: 'User created successfully'}
            render json: response, status: :created 
        else
            render json: @user.errors, status: :bad
        end 
    end

    def show
        byebug
        @user = User.find(:id)
        render json: @user
    end

    def index
        @users = User.all
        render json: UserSerializer.new(@users)
    end

    def update
        byebug
        user = User.find_by(id: params[:id])
        userdata = params[:user]
        if user
            if params[:user][:password]!=''
                user.callsign = params[:user][:callsign]
                user.password = params[:user][:password]
                user.email = params[:user][:email]
                user.my_qth = params[:user][:my_qth]
            else
                user.callsign = params[:user][:callsign]
                user.email = params[:user][:email]
                user.my_qth = params[:user][:my_qth]
            end
            if user.save
                response = { message: 'User updated successfully'}
                payload_data = {user: user.id}
			    token = JsonWebToken.encode(payload_data, exp_time)
			    render json: payload(user)
            else
                render json: @user.errors, status: :bad
            end
        end
    end
    
    
    private
    
    def user_params(*args)
        byebug
        params.permit(*args)
      end
end
