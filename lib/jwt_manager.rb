# lib/jwt_manager.rb
class JwtManager

    def self.encode(payload)
        priv_key = OpenSSL::PKey::RSA.new File.read 'priv_key.pem'
        payload[:exp] = (Time.now + ENV['JWT_EXP'].to_i.seconds).to_i
        { jwt: JWT.encode(payload, priv_key.to_s, 'HS256'), exp: payload[:exp] }
    end
    
    def self.decode(token)
        begin
            priv_key = OpenSSL::PKey::RSA.new File.read 'priv_key.pem'
            decoded = JWT.decode(token, priv_key.to_s, true, { algorithm: 'HS256' })
            user = HashWithIndifferentAccess.new decoded[0]
            return { success: true, user: user }
        rescue JWT::ExpiredSignature
            return { success: false, message: 'Expired signature' }
        rescue JWT::DecodeError
            return { success: false, message: 'Missing jwt' }
        rescue ActiveRecord::RecordNotFound
            return { success: false, message: 'Record not found' }
        end
    end

end