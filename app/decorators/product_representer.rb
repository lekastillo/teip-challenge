require 'roar/json/json_api'
class ProductRepresenter < Roar::Decorator
    include Roar::JSON::JSONAPI.resource :products

    attributes do
        property :name
        property :sku
        property :price
        property :stock
        property :description
        property :product_like_count
        property :status
        property :created_at
        property :updated_at
        property :deleted_at
    end
  
    # resource object links
    # link(:self) { "#{ENV['PROTOCOL']}://#{ENV['HOST']}:#{ENV['PORT']}/#{ENV['DEFAULT_WEB_API']}/#{represented.class.to_s.pluralize.downcase}/#{represented.id}" }

  end