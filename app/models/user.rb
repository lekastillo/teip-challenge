class User < ApplicationRecord
    has_many :orders
    has_many :products, through: :orders
    has_many :product_likes
end

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  email      :string           not null
#  last_names :string           not null
#  names      :string           not null
#  phone      :string           not null
#  role       :string           default("user")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#  index_users_on_email       (email) UNIQUE
#  index_users_on_phone       (phone) UNIQUE
#
