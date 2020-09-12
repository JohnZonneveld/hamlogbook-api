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
    
    private
    
    def user_params(*args)
        params.permit(*args)
      end
end
