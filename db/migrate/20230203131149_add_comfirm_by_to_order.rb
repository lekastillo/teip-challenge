class AddComfirmByToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :confirm_date, :date
  end
end
