require 'reform/form/dry'
module WebApi::Authentication::Contract
    class Login < Reform::Form
        feature Reform::Form::Dry

        property :email
        property :password
        
        validation do
            params do
                required(:email).filled
                required(:password).filled
            end
        end
    end
end