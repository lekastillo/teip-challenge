class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
end

# == Schema Information
#
# Table name: order_details
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  quantity   :integer          default(1), not null
#  subtotal   :decimal(12, 2)   default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_order_details_on_deleted_at  (deleted_at)
#  index_order_details_on_order_id    (order_id)
#  index_order_details_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#
