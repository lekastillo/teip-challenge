require 'reform/form/dry'
require 'dry/schema'

module WebApi::ProductLikes::Contract
    class Favorite < Reform::Form
        feature Reform::Form::Dry

        property :user_id
        property :product_id

        validation do
            json do
                required(:user_id).filled
                required(:product_id).filled
            end

            rule(:product_id, :user_id) do
                product_id = values[:product_id]
                user_id = values[:user_id]
                product_like = ProductLike.find_by(product_id: product_id, user_id: user_id)
                key.failure(text: 'User already like this product', product_id: product_id) if product_like
            end
        end
    end
end