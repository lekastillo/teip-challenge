class Product < ApplicationRecord
    paginates_per 10
    has_many :order_details
    has_many :product_likes

    enum :status, %i[out_of_stock in_stock running_low]

    validates :name, uniqueness: true
    validates :sku, uniqueness: true
    validates :price, numericality: { greater_than: 0}

    attr_accessor :user_id

    after_create :set_status_stock

    def set_status_stock
        sstatus = :in_stock
        sstatus = :out_of_stock if stock == 0
        sstatus = :running_low if stock < 10
        update(status: sstatus)
    end
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
