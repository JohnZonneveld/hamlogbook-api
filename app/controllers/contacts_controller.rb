class ContactsController < ApplicationController

    def index
        # byebug
        contacts = current_user.contacts.order(qso_date: :desc, time_on: :desc)
        # render json: contacts
        render json: {
				auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
				contacts: ContactSerializer.new(contacts)
			}
    end
    
end