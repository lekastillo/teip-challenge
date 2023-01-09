class CreateProductLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_likes do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :product_likes, :deleted_at

  end
end
