require 'rails_helper'

RSpec.describe MetricsController, type: :controller do

  before(:all) { 
    20.times do
       FactoryBot.create(:metric)
    end
  }

  describe "browsing data" do
    context "with and without params" do
      it "should show the index" do
        get :index
        expect(response.status).to eq 200
        has_selector? 'h6', text: 'OS VERSION'

      end
    end
  end

  describe "posting data to the API" do
    context "when values are invalid" do
      it "should return an error code if machine_id is invalid" do
        post :create, params: {
          metric: {
            machine_id: "foo",
            category: "ram_usage",
            value: 20
          }
        }
        expect(response.status).to eq 400
      end
    end


      it "should return an error code if category is missing" do
        post :create, params: {
          metric: {
            machine_id: Faker::Internet.uuid,
            category: nil,
            value: 20
          }
        }
        expect(response.status).to eq 400
      end
    end
      it "should return an error code if value is missing" do
        post :create, params: {
          metric: {
            machine_id: Faker::Internet.uuid,
            category: "ram_usage",
            value: nil
          }
        }
        expect(response.status).to eq 400
      end
    end


describe "creates or updates a metric" do 
  context "when machine_id and category exist" do 
    before do 
      @metric = Metric.last 
    end
    it "updates the existing value instead of creating a new metric record" do 
      post :create, params: {
        metric: {
          machine_id: @metric.machine_id,
          category: "ram_usage",
          value: 30
        }
      }
      expect(response.status).to eq 204
    end
  end
end

# Two tests that sends in fake category, uses metric.category 
