# = Rack::Session::Memcache
#
# Cookie based session management.
#
# The data was stored in memcached.
#
# NOTE:
#   Maybe you have to remove cookie named 'rack.session'.
#
# Requirement:
#   memcache-client (gem)
#   running memcached on localhost (port: 11211)

require 'app/session'

use Rack::Session::Memcache, :memcache_server => 'localhost:11211', :key => 'rack.session', :expire_after => 3600

run SessionApp.new
