module CrmApi::Orders::Operation
  class Confirm < Trailblazer::Operation
    step :find_order
    step :confirm_order

    def find_order(ctx, **)
      ctx[:order] = Order.find(ctx[:params][:order_id])
    end

    def confirm_order(ctx, **)
      order = ctx[:order]
      result = false
      if order.may_confirm? and order.status == 'new'
        order.update(
          confirmed_by: ctx[:params][:current_user_id],
          confirm_date: Time.now
        )
      
        begin
          order.confirm!
        rescue => e
          ctx[:errors] = e.message
        end
        result = true
      else
        ctx[:errors] = 'order is not allowed to be confirmed'
      end
      result
    end
  end
end