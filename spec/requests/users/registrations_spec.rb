require 'rails_helper'

RSpec.describe "Users::Registrations", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/users/registrations/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/users/registrations/update"
      expect(response).to have_http_status(:success)
    end
  end

end
