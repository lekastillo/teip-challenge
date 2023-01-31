require 'roar/json/json_api'
class OrderDetailRepresenter < Roar::Decorator
    include Roar::JSON::JSONAPI.resource :order_details

    attributes do
        property :order_id
        property :product, decorator: ProductRepresenter
        property :quantity
        property :subtotal
        property :created_at
        property :updated_at
        property :deleted_at
    end
end