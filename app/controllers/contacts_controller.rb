class ContactsController < ApplicationController

    def index
        byebug
        contacts = current_user.contacts
        # render json: contacts
        render json: {
				auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
				contacts: contacts
			}
    end
    
end