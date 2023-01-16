module WebApi::Authentication::Operation
  class Signup < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: WebApi::Authentication::Contract::Signup)
    step Contract::Validate()
    step Contract::Persist()
  end
end
  