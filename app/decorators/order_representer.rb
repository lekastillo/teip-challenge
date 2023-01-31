require 'roar/json/json_api'
class OrderRepresenter < Roar::Decorator
    include Roar::JSON::JSONAPI.resource :orders

    attributes do
        property :date
        property :status
        property :total
        property :user, decorator: UserRepresenter
        property :created_at
        property :updated_at
        property :deleted_at
        collection :order_details, extend: OrderDetailRepresenter, class: OrderDetail
    end

    link(:self) { "#{ENV['PROTOCOL']}://#{ENV['HOST']}:#{ENV['PORT']}/#{ENV['DEFAULT_WEB_API']}/#{represented.class.to_s.pluralize.downcase}/#{represented.id}" }

    # has_many :order_details, class: OrderDetail, decorator: OrderDetailRepresenter
  end