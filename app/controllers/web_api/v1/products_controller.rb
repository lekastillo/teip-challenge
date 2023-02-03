class WebApi::V1::ProductsController < WebController

  def index
    run WebApi::Products::Operation::Index do |ctx, _params: {page: params[:page] || 1}, **|
      render json: ctx[:products]
    end
  end

  def show
    run WebApi::Products::Operation::Show do |ctx, _params: params[:id], **|
      render json: ctx[:product]
    end
  end
end