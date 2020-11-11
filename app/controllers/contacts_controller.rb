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

	def create
		contact = Contact.new(contact_params)
		contact.user_id = current_user.id
		if contact.save
		  render json: {
			auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
			contact: ContactDetailSerializer.new(contact)
		  }
		else
			render json: { errors: "failed to create contact" }, status: :not_acceptable
		end
	end
	

	def update
		contact = current_user.contacts.find(params[:id])
		if contact.update_attributes(contact_params)
			response = { message: 'Contact updated successfully'}
			render json: {
			auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
			contact: ContactDetailSerializer.new(contact)
			}
		else
			render json: { errors: "failed to update contact" }, status: :not_acceptable
		end
	end

	def destroy
		contact = Contact.find(params[:id])
		if contact.destroy
			response = { message: 'Contact deleted successfully'}
			render json: {
			auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
			message: 'Contact deleted successfully'
			}
		else
			render json: { errors: "failed to update contact" }, status: :not_acceptable
		end
	end
	
	private

	def contact_params
		params.require(:contact).permit!
	end
		
end