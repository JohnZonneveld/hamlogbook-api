class ContactSerializer
	include FastJsonapi::ObjectSerializer
	attributes :id, :owncall, :call, :qso_date, :time_on, :band, :mode, :freq, :country
end