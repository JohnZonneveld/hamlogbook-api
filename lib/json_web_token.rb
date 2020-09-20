class JsonWebToken
	def self.encode(payload, expiration)
		payload[:exp] = expiration.to_i
		JWT.encode(payload, ENV['JWT_SECRET'])
	  end
	
	  def self.decode(token)
		return JWT.decode(token, ENV['JWT_SECRET'])[0]
	  rescue
		'FAILED'
	  end
end