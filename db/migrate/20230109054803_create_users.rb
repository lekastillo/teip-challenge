class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :names, null: false
      t.string :last_names, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :role, default: 'user'
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true
    add_index :users, :deleted_at

  end
end
