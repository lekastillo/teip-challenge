class CrmApi::V1::OrdersController < CrmController

  def cancel
    
    result = CrmApi::Orders::Operation::Cancel.(params: { order_id: params[:order_id], current_user_id: @current_user.id, cancel_reason: params[:cancel_reason]})
    if result.success?
      render nothing: true, status: :ok
      return
    else
      render json: { cancel: result[:"errors"].messages.as_json, message: "unable to cancel order, check errors" }, status: :bad_request
      return
    end
  end

  def confirm
    
    result = CrmApi::Orders::Operation::Confirm.(params: { order_id: params[:order_id], current_user_id: @current_user.id })
    if result.success?
      render nothing: true, status: :ok
      return
    else
      render json: { cancel: result[:"errors"].as_json, message: "unable to cancel order, check errors" }, status: :bad_request
      return
    end
  end

  
end