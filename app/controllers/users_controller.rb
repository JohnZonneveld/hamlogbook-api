class UsersController < ApplicationController
    def register
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
    
    
    private
    
    def user_params(*args)
        params.permit(*args)
      end
end
