class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :status, default: 'new' 
      t.decimal :total, default: 0, null: false, precision: 12, scale: 2
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :orders, :deleted_at
  end
end
