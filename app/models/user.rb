class User < ApplicationRecord
    has_many :orders
    has_many :products, through: :orders
    has_many :product_likes
end
