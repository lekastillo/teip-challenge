require 'reform/form/dry'
module CrmApi::Products::Contract
    class Create < Reform::Form
        feature Reform::Form::Dry

        property :name
        property :price
        property :description
        property :sku
        property :stock
        
        validation do
            params do
                required(:name).filled
                required(:price).filled
                required(:description).filled
                required(:sku).filled
                required(:stock).filled
            end

            rule(:sku) do
                key.failure('must be unique') if Product.where(sku: value).exists?
            end

            rule(:name) do
                key.failure('must be unique') if Product.where(name: value).exists?
            end

            # rule(:price) do
            #     key.failure('must be greater than cero') if value.positive?
            # end
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