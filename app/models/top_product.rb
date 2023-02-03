class TopProduct < ApplicationRecord
    self.primary_key = :id

    def readonly?
        true
    end
end

# == Schema Information
#
# Table name: top_products
#
#  id     :bigint           primary key
#  amount :decimal(, )
#  name   :string
#  sells  :bigint
#
