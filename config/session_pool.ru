require 'app/session'

# wrong parser?
# appended 'expired_at=...'
use Rack::Session::Pool, :key => 'rack.session', :path => '/', :expire_after => 3600

run SessionApp.new
