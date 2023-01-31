module WebApi::Orders::Operation
    class AddProduct < Trailblazer::Operation
      step Model(OrderDetail, :new)
      step Contract::Build(constant: WebApi::Orders::Contract::AddProduct)
      step Contract::Validate()
      step Contract::Persist()
  
    end
  
  end