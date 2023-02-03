class AddCancelReasonToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :cancel_reason, :string
  end
end
