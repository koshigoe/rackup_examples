# = Rack::ConditionalGet
#
# Conditional GET.
#
# e.g.
#
#   [1] $ rackup -E deployment config/conditional_get.ru
#   [2] $ curl http://localhost:9292/
#   [2] $ curl -v -H 'If-None-Match: etag' http://localhost:9292/
#   [2] $ curl -v -H 'If-Modified-Since: Wed, 15 Nov 1995 04:58:08 GMT' http://localhost:9292/

require 'app/conditional_get'

# == [A] specified application
#conditional_app = Rack::ConditionalGet.new(ConditionalGetApp.new)
#
#run conditional_app

# == [B ] whole application
use Rack::ConditionalGet

run ConditionalGetApp.new
