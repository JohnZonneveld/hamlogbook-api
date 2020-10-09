class ContactsController < ApplicationController

    def index
        byebug
        contacts = current_user.contacts
        render json: contacts
    end
    
end