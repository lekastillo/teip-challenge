module WebApi::Products::Operation
  class Index < Trailblazer::Operation
    step :find_all

    def find_all(ctx, **)
      ctx[:products] = ProductsRepresenter.for_collection.new(::Product.page(ctx[:params][:page])).to_json
    end
  end
end
