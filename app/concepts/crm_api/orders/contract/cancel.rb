require 'reform/form/dry'
module CrmApi::Orders::Contract
    class Cancel < Dry::Validation::Contract
        params do
            required(:cancel_reason).filled
            required(:current_user_id).filled
            required(:order_id).filled
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