require 'roar/json/json_api'
class TopProductRepresenter < Roar::Decorator
    include Roar::JSON::JSONAPI.resource :top_products

    attributes do
        property :id
        property :name
        property :sells
        property :amount
    end
end