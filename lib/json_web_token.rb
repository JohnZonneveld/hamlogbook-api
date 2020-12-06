class JsonWebToken
	def self.encode(payload, expiration)
		payload[:exp] = expiration
		JWT.encode(payload, ENV['JWT_SECRET'],'HS256')
	end
	
	def self.decode(token)
		begin
			return JWT.decode(token, ENV['JWT_SECRET'],'HS256')[0]
		rescue
			'FAILED'
		end
	end
	
end