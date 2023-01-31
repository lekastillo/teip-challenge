require 'roar/json/json_api'
class UserRepresenter < Roar::Decorator
    include Roar::JSON::JSONAPI.resource :users

    attributes do
        property :names
        property :last_names
        property :email
        property :phone
        property :role
    end
  
    # # resource object links
    # link(:self) { "#{ENV['PROTOCOL']}://#{ENV['HOST']}:#{ENV['PORT']}/#{ENV['DEFAULT_WEB_API']}/#{represented.class.to_s.pluralize.downcase}/#{represented.id}" }

  end