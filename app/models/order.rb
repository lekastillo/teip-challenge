class Order < ApplicationRecord
  include AASM
  belongs_to :user
  has_many :order_details
  has_many :products, through: :order_details

  attr_accessor :cart

  aasm(:status, column: 'status') do
    state :new, initial: true
    state :confirmed
    state :cancelled

    event :confirm do
      transitions from: :new, to: :confirmed
    end

    event :cancel, after: :process_order_cancelation do
      transitions from: :new, to: :cancelled
    end
  end

  def process_order_cancelation
    order_to_cancel = self
    order_details = order_to_cancel.order_details
    order_details.each do |cart_item|
      product = Product.find_by(id: cart_item.product_id)

      ProductTransaction.create(
        affected_qty: cart_item.quantity.to_i,
        new_balance: product.stock + cart_item.quantity.to_i,
        old_balance: product.stock,
        operation: 'add',
        transaction_type: 'cancelation',
        product_id: product.id,
        order_id: order_to_cancel.id,
        user_id: order_to_cancel.cancelled_by
      )

      product.update(stock: product.stock + cart_item.quantity.to_i)
    end
  end
end

# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  cancel_reason  :string
#  cancelled_by   :integer
#  cancelled_date :date
#  confirm_date   :date
#  confirmed_by   :integer
#  date           :date
#  deleted_at     :datetime
#  status         :string           default("new")
#  total          :decimal(12, 2)   default(0.0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_orders_on_deleted_at  (deleted_at)
#  index_orders_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
