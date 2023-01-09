class CreateProductTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_transactions do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :order
      t.integer :affected_qty, null: false
      t.integer :old_balance, null: false
      t.integer :new_balance, null: false
      t.string :type, null: false
      t.string :operation, null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :product_transactions, :deleted_at
  end
end
