require 'app/session'

# require gem, memcache-client
# Maybe you have to remove cookie named rack.session(your named key).
use Rack::Session::Memcache, :memcache_server => 'localhost:11211', :key => 'rack.session', :expire_after => 3600

run SessionApp.new
