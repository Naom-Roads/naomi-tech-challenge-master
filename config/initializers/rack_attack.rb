class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # throttle post /metrics 1 minute per ip

  throttle('req/ip', limit: 1, period: 60) do |req|
    req.ip if req.path == '/metrics' && req.post?
  end
end

