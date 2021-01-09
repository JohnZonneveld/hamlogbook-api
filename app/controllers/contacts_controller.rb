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
			contact: ContactSerializer.new(contact)
		}
	end

	def create
		byebug
		contact = Contact.new(contact_params)
		contact.user_id = current_user.id
		if contact.save
		  	render json: {
				auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
				contact: ContactSerializer.new(contact),
				success: "Contact created succesfully"
		  	}
		else
			render json: { 
				auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
				errors: contact.errors.full_messages 
			}, status: :not_acceptable
		end
	end
	

	def update
		contact = current_user.contacts.find(params[:contact][:id])
		if contact.update(contact_params)
			render json: {
			auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
			contact: ContactSerializer.new(contact),
			success: "Contact updated successfully"
			}
		else
			render json: { 
				auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
				errors: contact.errors.full_messages 
			}, status: :not_acceptable
		end
	end

	def destroy
		contact = Contact.find(params[:id])
		if contact.destroy
			render json: {
				auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
				success: "Contact deleted successfully"
			}
		else
			render json: { 
				auth_token: JsonWebToken.encode({user_id: current_user.id}, exp_time),
				errors: "failed to update contact" 
			}, status: :not_acceptable
		end
	end
	
	private

	def contact_params
		params.require(:contact).permit!
	end

end