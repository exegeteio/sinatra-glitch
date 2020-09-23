$:.unshift(File.dirname(__FILE__))

require 'rack/attack'
require 'active_support/cache'
Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
Rack::Attack.throttle("requests by ip", limit: 5, period: 2) do |request|
  request.ip
end
use Rack::Attack

require './app'
run App
