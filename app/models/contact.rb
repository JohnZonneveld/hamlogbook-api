class Contact < ApplicationRecord
    belongs_to :user

    validates_presence_of :call, :freq, :mode, :band, :my_gridsquare
    validates :my_gridsquare, :gridsquare, format: { with: /\A([A-R]{2}[0-9]{2})\z|\A([A-R]{2}[0-9]{2}[a-x]{2})\z|\A([A-R]{2}[0-9]{2}[a-x]{2}[0-9]{2})\z/ }
	  
end
