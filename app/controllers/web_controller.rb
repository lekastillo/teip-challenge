class WebController < ApplicationController
    include Authenticable
    before_action :authenticate_user
    
end
