class WebApi::V1::OrdersController < ApplicationController

  def index
    run WebApi::Orders::Operation::Index do |ctx, _params: { page: params[:page] || 1 }, **|
      render json: ctx[:orders]
    end
  end

  def create
    # binding.pry
    run WebApi::Orders::Operation::Create do |ctx, _params: params[:order], **|
      if ctx[:"contract.default"].model.persisted?
        order = OrderRepresenter.new(ctx[:"contract.default"].model)
        render json: { order: order.as_json }, status: :created
      else
        render json: { order: ctx[:"contract.default"].as_json }, status: :created
      end
      return
    end
    render json: { errors: result[:"contract.default"].errors.messages.as_json, message: "unable to create order, check errors" }
  end
  
  def add_products
    run WebApi::Orders::Operation::AddProduct do |ctx, _params: params[:order_detail], **|
      if ctx[:"contract.default"].model.persisted?
        # order = OrderRepresenter.new(ctx[:"contract.default"].model)
        render json: { order: ctx[:"contract.default"].model.as_json }, status: :created
      else
        render json: { order: ctx[:"contract.default"].as_json }, status: :created
      end
      return
    end
    render json: { errors: result[:"contract.default"].errors.messages.as_json, message: "unable to create add product to order, check errors" }
  end

end