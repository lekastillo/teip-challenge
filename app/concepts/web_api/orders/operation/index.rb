module WebApi::Orders::Operation
  class Index < Trailblazer::Operation
    step :find_all

    def find_all(ctx, **)
      ctx[:orders] = OrderRepresenter.for_collection.new(::Order.includes(order_details: :product).where(user_id: ctx[:current_user].id).page(ctx[:params][:page] || 1)).to_json
    end
  end
end
