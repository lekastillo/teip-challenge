class WebApi::V1::ProductLikesController < WebController

  def create
    # binding.pry
    run WebApi::ProductLikes::Operation::Favorite do |ctx, _params: params[:product_like], **|
      if ctx[:"contract.default"].model.persisted?
        favorite = ProductLikeRepresenter.new(ctx[:"contract.default"].model)
        render json: { product_like: favorite.as_json }, status: :created
      else
        render json: { product_like: ctx[:"contract.default"].as_json }, status: :created
      end
      return
    end
    render json: { errors: result[:"contract.default"].errors.messages.as_json, message: "unable to create favorite, check errors" }
  end
end