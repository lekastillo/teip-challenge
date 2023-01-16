require 'jwt_manager'
module Authenticable
    attr_reader :current_user
    private
  
    def authenticate_user
        payload = JwtManager.decode(token)
        if payload[:success]  
            @current_user = User.find(payload[:user][:id])
        else
            render json: { errors: payload[:message] }, status: :unauthorized
        end
    end
  
    def token
      request.headers['Authorization']&.split&.last
    end
end