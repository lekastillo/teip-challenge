module CrmApi::Orders::Operation
  class Cancel < Trailblazer::Operation
    
    step :find_order
    step :cancel_order
    # step :notify_order_canncellation

    def find_order(ctx, **)
      ctx[:order] = Order.find(ctx[:order_id])
    end

    def confirm_order
      order = ctx[:order]
      user = ctx[:current_user]
      if may_confirm?
        order.set(
          confirmed_by: user.id,
          confirm_date: Time.now
        )
        order.confirm!
      end
    end
  end
end