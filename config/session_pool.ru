# = Rack::Session::Pool
#
# Cookie based session management.
#
# The data was stored in Hash object.
#
# NOTE:
#   If web server stopped, data will lost.

require 'app/session'

use Rack::Session::Pool, :key => 'rack.session', :path => '/', :expire_after => 3600

run SessionApp.new
