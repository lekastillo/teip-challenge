class WebApi::V1::ProductsController < ApplicationController

  def index
    run WebApi::Products::Operation::Index do |ctx, _params: {page: params[:page] || 1}, **|
      render json: ctx[:products]
    end
  end

  def show
  end
end