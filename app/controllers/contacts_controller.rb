class ContactsController < ApplicationController

    def index
        contacts = current_user.contacts.order(qso_date: :desc, time_on: :desc)
        render json: {
				auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
				contacts: ContactSerializer.new(contacts)
			}
    end

    def show
        contact = current_user.contacts.find(params[:id])
        render json: {
				auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
				contact: ContactDetailSerializer.new(contact)
			}
    end
    
    
end