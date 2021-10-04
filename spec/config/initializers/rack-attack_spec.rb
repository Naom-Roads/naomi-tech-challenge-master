require 'rails_helper'

describe 'Rack::Attack', type: :request do
  before(:each) do
    Rack::Attack.reset!
    setup_rack_attack_cache_store
  end

  def setup_rack_attack_cache_store
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  end


  it "throttle excessive requests by IP Address" do
    limit = 2
    period = 600
    ip = "1.2.3.4"
    limit.times do
      Rack::Attack.cache.count("metrics/ip:#{ip}", period)
    end

    post "/metrics", headers: { REMOTE_ADDR: ip }
    expect(response).to have_http_status(:too_many_requests)
    end
end
