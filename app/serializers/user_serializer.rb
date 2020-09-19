class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :callsign, :email, :my_qth
end
