module CrmApi::Products::Operation
  class Create < Trailblazer::Operation
    step Model(Product, :new)
    step Contract::Build(constant: CrmApi::Products::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :create_product_transaction

    def create_product_transaction(ctx, **)
      new_product_created = ctx[:"contract.default"].model

      ProductTransaction.create(
        affected_qty: new_product_created.stock,
        new_balance: new_product_created.stock,
        old_balance: new_product_created.stock,
        operation: 'add',
        transaction_type: 'inventory_load',
        product_id: new_product_created.id,
        user_id: ctx[:params][:user_id]
      )
    end
  end
end