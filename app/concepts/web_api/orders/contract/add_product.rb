require 'reform/form/dry'
module WebApi::Orders::Contract
    class AddProduct < Reform::Form
        feature Reform::Form::Dry

        property :order_id
        property :product_id
        property :quantity
        property :subtotal
        
        validation do
            params do
                required(:order_id).filled
                required(:product_id).filled
                required(:quantity)..filled(min_size?: 1)
            end

            rule(:order_id) do
                key.failure('should exist') if Order.where(id: value).exists?
                key.failure('order cant be modified') if Order.find(id: value).status != 'new'
            end

            rule(:product_id) do
                key.failure('should exist') if Product.where(id: value).exists?
                key.failure('is out of stock') if Product.find(id: value).status == 'out_of_stock'
            end
        end
    end
end