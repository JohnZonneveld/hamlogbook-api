class Contact < ApplicationRecord
    belongs_to :user

    validates_presence_of :call, :freq, :mode, :band
    validates :my_gridsquare, format: { with: /\A([A-R]{2}[0-9]{2})\z|\A([A-R]{2}[0-9]{2}[a-x]{2})\z|\A([A-R]{2}[0-9]{2}[a-x]{2}[0-9]{2})\z/ }
    validates :gridsquare, format: { with: /\A([A-R]{2}[0-9]{2})\z|\A([A-R]{2}[0-9]{2}[a-x]{2})\z|\A([A-R]{2}[0-9]{2}[a-x]{2}[0-9]{2})\z/ }
	  
end
