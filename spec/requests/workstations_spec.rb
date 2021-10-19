require 'rails_helper'

RSpec.describe "Workstations", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/workstations/show"
      expect(response).to have_http_status(:success)
    end
  end

end