require 'rails_helper'

RSpec.describe "Machines", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/machine/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    it "returns http success" do
      get "/machine/search"
      expect(response).to have_http_status(:success)
    end
  end

end
