# = Rack::Session::Cookie
#
# Cookie based session management.
#
# The data was stored in cookie.

require 'app/session'

use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :expire_after => 3600

run SessionApp.new
