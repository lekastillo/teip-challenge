class CreateTopProducts < ActiveRecord::Migration[7.0]
  def change
    create_view :top_products
  end
end
