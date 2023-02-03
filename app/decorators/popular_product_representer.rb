require 'roar/json/json_api'
class PopularProductRepresenter < Roar::Decorator
    include Roar::JSON::JSONAPI.resource :popular_products

    attributes do
        property :id
        property :name
        property :likes
    end
end