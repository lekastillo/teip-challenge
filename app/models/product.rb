class Product < ApplicationRecord
    belongs_to :order_detail
    belongs_to :product_like
end
