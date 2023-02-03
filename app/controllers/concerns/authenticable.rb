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
    
    def authenticate_user_admin
        
        payload = JwtManager.decode(token)
        if payload[:success]  
            user = User.find(payload[:user][:id])
            if user.role == 'admin'
                @current_user = User.find(payload[:user][:id])
            else
                render json: { errors: 'Opertion not allowed, only a role admin can perform it.' }, status: :forbidden
            end
        else
            render json: { errors: payload[:message] }, status: :unauthorized
        end
    end
  
    def token
      request.headers['Authorization']&.split&.last
    end
end