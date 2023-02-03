module WebApi::ProductLikes::Operation
  class Favorite < Trailblazer::Operation
    step Model(ProductLike, :new)
    step Contract::Build(constant: WebApi::ProductLikes::Contract::Favorite, builder: :default_contract!)
    step Contract::Validate()
    step Contract::Persist()

    def default_contract!(options, constant:, model:, **)
      constant.new(model, user_id: options[:current_user].id, product_id: options[:params][:product_like][:product_id])
    end

  end

end