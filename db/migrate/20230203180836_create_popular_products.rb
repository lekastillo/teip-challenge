class CreatePopularProducts < ActiveRecord::Migration[7.0]
  def change
    create_view :popular_products
  end
end
