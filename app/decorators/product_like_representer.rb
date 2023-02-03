require 'roar/json/json_api'
class ProductLikeRepresenter < Roar::Decorator
    include Roar::JSON::JSONAPI.resource :product_likes

    attributes do
        property :product, decorator: ProductRepresenter
        property :user, decorator: UserRepresenter
        property :created_at
        property :updated_at
        property :deleted_at
    end
  
    # resource object links
    # link(:self) { "#{ENV['PROTOCOL']}://#{ENV['HOST']}:#{ENV['PORT']}/#{ENV['DEFAULT_WEB_API']}/#{represented.class.to_s.pluralize.downcase}/#{represented.id}" }

  end