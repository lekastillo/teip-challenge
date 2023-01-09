class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, default: 1, null: false
      t.decimal :subtotal, default: 0, null: false, precision: 12, scale: 2
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :order_details, :deleted_at
  end
end
