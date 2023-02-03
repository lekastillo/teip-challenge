class CrmApi::V1::ProductsController < CrmController

  def create
    result = CrmApi::Products::Operation::Create.(params: {**params.require(:product).permit!.to_h, user_id: @current_user.id})
    if result.success?
      render nothing: true, status: :created
      return
    else
      render json: { product: result[:"contract.default"].errors.messages.as_json, message: "unable to create product, check errors" }, status: :bad_request
      return
    end
  end
end