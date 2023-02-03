class AddCancelledByToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :cancelled_by, :integer
    add_column :orders, :cancelled_date, :date
  end
end
