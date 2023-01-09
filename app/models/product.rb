class Product < ApplicationRecord
    has_many :order_details
    has_many :product_likes

    enum :status, %i[out_of_stock in_stock running_low]

    validates :name, uniqueness: true
    validates :sku, uniqueness: true
    validates :price, numericality: { greater_than: 0}
end

# == Schema Information
#
# Table name: products
#
#  id                 :bigint           not null, primary key
#  deleted_at         :datetime
#  description        :text
#  name               :string
#  price              :decimal(12, 2)   default(0.0), not null
#  product_like_count :integer
#  sku                :string
#  status             :string           default(NULL)
#  stock              :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_products_on_deleted_at  (deleted_at)
#  index_products_on_sku         (sku) UNIQUE
#
