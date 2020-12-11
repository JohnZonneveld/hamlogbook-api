class ContactSerializer
	include FastJsonapi::ObjectSerializer
	attributes :id, :owncall, :station_callsign, :my_gridsquare, :call, :band, :freq, :freq_rcvd, :mode, :submode, :modegroup, :qso_date, :time_on, :qsl_rcvd, :qsl_rdate, :dxcc, :country, :iota, :gridsquare, :state, :cnty, :cqz, :ituz, :park;
end

