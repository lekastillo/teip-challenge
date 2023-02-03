class CrmController < ApplicationController
    include Authenticable
    before_action :authenticate_user_admin
    
end
