module WebApi::Products::Operation
  class Popular < Trailblazer::Operation
    step :find_all

    def find_all(ctx, **)
      ctx[:popular_products] = PopularProductRepresenter.for_collection.new(::PopularProduct.all).to_json
    end
  end
end
