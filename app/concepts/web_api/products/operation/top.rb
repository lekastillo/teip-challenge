module WebApi::Products::Operation
  class Top < Trailblazer::Operation
    step :find_top_products

    def find_top_products(ctx, **)
      ctx[:top_products] = TopProductRepresenter.for_collection.new(::TopProduct.all).to_json
    end
  end
end
