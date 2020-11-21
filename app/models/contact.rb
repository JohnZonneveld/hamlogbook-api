class Contact < ApplicationRecord
    belongs_to :user

    validates_presence_of :call, :gridsquare, :freq, :mode, :band
    validates_format_of :my_gridsquare, with: /[A-R]{2}[0-9]{2}([a-x]{2})?([0-9]{2})?/, on: :create
    validates_format_of :gridsquare, with: /[A-R]{2}[0-9]{2}([a-x]{2})?([0-9]{2})?/, on: :update
	  
end
