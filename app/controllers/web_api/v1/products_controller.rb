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

  def top_products
    run WebApi::Products::Operation::Top do |ctx, _params: {}, **|
      render json: ctx[:top_products]
    end
  end

  def popular_products
    run WebApi::Products::Operation::Popular do |ctx, _params: {}, **|
      render json: ctx[:popular_products]
    end
  end

end