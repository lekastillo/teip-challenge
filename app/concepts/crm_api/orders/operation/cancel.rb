require 'dry-validation'
module CrmApi::Orders::Operation
  class Cancel < Trailblazer::Operation
    step :validate_cancel_params
    step :find_order
    step :cancel_order


    def validate_cancel_params(ctx, **)
      contract = CrmApi::Orders::Contract::Cancel.new

      errors = contract.call(ctx[:params]).errors
      ctx[:errors] = errors
      false unless errors.empty?
      true
    end

    def find_order(ctx, **)
      ctx[:order] = Order.find(ctx[:params][:order_id])
    end

    def cancel_order(ctx, **)
      order = ctx[:order]
      
      if order.may_cancel?
        order.update(
          cancel_reason: ctx[:params][:cancel_reason],
          cancelled_by: ctx[:params][:current_user_id],
          cancelled_date: Time.now
        )
        order.cancel!
      end
    end
  end
end