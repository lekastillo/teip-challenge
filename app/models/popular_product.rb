class PopularProduct < ApplicationRecord
    self.primary_key = :id

    def readonly?
        true
    end
end

# == Schema Information
#
# Table name: popular_products
#
#  id    :bigint           primary key
#  likes :bigint
#  name  :string
#
