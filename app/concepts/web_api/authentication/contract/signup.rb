require 'reform/form/dry'
module WebApi::Authentication::Contract
    class Signup < Reform::Form
        feature Reform::Form::Dry

        property :names
        property :email
        property :password
        property :password_confirmation
        property :last_names
        property :phone
        
        validation do
            params do
                required(:names).filled
                required(:email).filled
                required(:password).filled
                required(:phone).filled
                required(:password_confirmation).filled
            end

            rule(:email) do
                unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
                    key.failure('has invalid format')
                end

                key.failure('must be unique') if User.where(email: value).exists?
            end
            
            rule(:phone) do
                key.failure('must be unique') if User.where(phone: value).exists?
            end

            rule(:password, :password_confirmation) do
                key.failure('must coincide') if !values[:password].eql?(values[:password_confirmation])
            end
        end
    end
end

# User fields
#  email           :string           not null
#  last_names      :string           not null
#  names           :string           not null
#  password_digest :string
#  phone           :string           not null
#  role            :string           default("user")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null