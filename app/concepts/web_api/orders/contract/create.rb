require 'reform/form/dry'
require 'dry/schema'

CartProduct = Dry::Schema.JSON do
    required(:product_id).value(:integer)
    required(:quantity).value(:integer)
end
module WebApi::Orders::Contract
    class Create < Reform::Form
        feature Reform::Form::Dry

        property :user_id
        property :date
        property :cart
        
        validation do
            
            json do
                required(:user_id).value(:integer)
                required(:date).filled
                required(:cart).array(CartProduct)
            end
            rule(:cart).each do
                product_cart = value
                product = Product.find_by(id: product_cart[:product_id])
                key.failure(text: 'Product not found', product_id: product_cart[:product_id]) if product.nil?
                if product.present? && product.stock <= product_cart[:quantity]
                    key.failure(text: 'Product quantity not available', product_id: product_cart[:product_id])
                end
            end
        end
    end
end