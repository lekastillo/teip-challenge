class AddConfirmedByToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :confirmed_by, :integer
  end
end
