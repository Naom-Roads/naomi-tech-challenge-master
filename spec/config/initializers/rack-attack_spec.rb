require 'rails_helper'

def setup_rack_attack_cache_store
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
end

describe 'Rack::Attack', type: :request do
  include Rack::Test::Methods
  before(:each) do
    Rack::Attack.reset!
    setup_rack_attack_cache_store
    @limit = 1
    @period = 600
    @ip = "1.2.3.4"
  end

  describe "throttle excessive POST requests by IP Address" do
    context "number of requests is lower than the limit" do
      it "does not change the request status" do
        @limit.times do
          post "/metrics", {}, "REMOTE_ADDR" => @ip
        end
        expect(last_response.status).to_not eq(429)
      end
    end

    context "number of requests is higher than limit" do
      it "changes the request status to 429" do
        (@limit * 2).times do |i|
          post "/metrics", headers: { "REMOTE_ADDR" => @ip }
        end
        expect(last_response.status).to eq(429)
      end
    end
  end
end






