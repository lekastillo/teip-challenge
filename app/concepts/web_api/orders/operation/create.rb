module WebApi::Orders::Operation
  class Create < Trailblazer::Operation
    step Model(Order, :new)
    step Contract::Build(constant: WebApi::Orders::Contract::Create, builder: :default_contract!)
    step Contract::Validate()
    step Contract::Persist()

    step :create_order_details

    def default_contract!(options, constant:, model:, **)
      constant.new(model, user_id: options[:current_user].id, date: Time.now.to_date, cart: options[:params][:order][:cart])
    end

    def create_order_details(ctx, **)
      new_order_created = ctx[:"contract.default"].model
      
      cart = new_order_created.cart
      
      cart.each do |cart_item|
        # binding.pry
        product = Product.find_by(id: cart_item[:product_id])
        subtotal = (cart_item[:quantity].to_i * product.price).to_f

        if OrderDetail.create(order_id: new_order_created.id,product_id: product.id, quantity: cart_item[:quantity].to_s, subtotal: subtotal)

          # reduce quantity to product
          product.update(stock: product.stock - cart_item[:quantity].to_i)
          new_order_created.total = new_order_created.total + subtotal
          new_order_created.save
        end
      end

    end
  end

end