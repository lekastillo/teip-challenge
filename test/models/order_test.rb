require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
