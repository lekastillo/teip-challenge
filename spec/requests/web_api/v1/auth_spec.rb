require 'rails_helper'

RSpec.describe "WebApi::V1::Auths", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/web_api/v1/auth/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /signup" do
    it "returns http success" do
      get "/web_api/v1/auth/signup"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /logout" do
    it "returns http success" do
      get "/web_api/v1/auth/logout"
      expect(response).to have_http_status(:success)
    end
  end

end
