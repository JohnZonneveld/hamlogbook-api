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

	def update
		byebug
		contact = current_user.contacts.find(params[:id])
		if contact.update_attributes(contact_params)
			response = { message: 'Contact updated successfully'}
			render json: {
			auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
			contact: ContactDetailSerializer.new(contact)
			}
		else
			render :json => { :errors => @model.errors.full_messages }, :status => 422
		end
	end

	def contact_params
		params.require(:contact).permit!
	end
		
		
		
end