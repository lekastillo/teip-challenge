module WebApi::Authentication::Operation
  class Login < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: WebApi::Authentication::Contract::Login)
      step Contract::Validate()

      step :generate_jwt_token

      def generate_jwt_token(ctx, **)
          
          user = User.find_by_email(ctx[:params][:email])
          if user&.authenticate(ctx[:params][:password])

            jwt_result = JwtManager.encode(user.as_json.except("password_digest"))
            time = jwt_result[:exp]
            resp = {
              token: jwt_result[:jwt],
              exp: time,
              email: user.email
            }
            ctx[:resp] = resp
          else
              false
          end
      end

  end
end
