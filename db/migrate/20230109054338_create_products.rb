class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :stock, default: 0, null: false
      t.string :sku
      t.decimal :price, default: 0, null: false, precision: 12, scale: 2
      t.string :status, default: 'out_of_stock'
      t.text :description
      t.integer :product_like_count
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :products, :sku, unique: true
    add_index :products, :deleted_at

  end
end
