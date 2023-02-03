module WebApi::Products::Operation
  class Show < Trailblazer::Operation
    step :find

    def find(ctx, **)
      ctx[:product] = ProductRepresenter.new(::Product.find(ctx[:params][:id])).to_json
    end
  end
end
