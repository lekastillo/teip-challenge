class ProductTransaction < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :order, optional: true

  enum :operation, { add: 'add', subtract: 'subtract' }
  enum :transaction_type, { inventory_load: 'inventory_load', sale: 'sale', cancelation: 'cancelation', broken: 'broken' }
end

# == Schema Information
#
# Table name: product_transactions
#
#  id               :bigint           not null, primary key
#  affected_qty     :integer          not null
#  deleted_at       :datetime
#  new_balance      :integer          not null
#  old_balance      :integer          not null
#  operation        :string           not null
#  transaction_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  order_id         :bigint
#  product_id       :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_product_transactions_on_deleted_at  (deleted_at)
#  index_product_transactions_on_order_id    (order_id)
#  index_product_transactions_on_product_id  (product_id)
#  index_product_transactions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
