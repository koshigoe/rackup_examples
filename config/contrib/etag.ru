#= Rack::ETag
#
# > Automatically sets the ETag header on all String bodies.
#
# I don't know how to remove Content-Type header,
# when return 304 status code.
#
# e.g.
#
#   [1] $ rackup -E deployment config/contrib/etag.ru
#   [2] $ curl -v http://localhost:9292/
#   ...
#   < Etag: "25a98e5c7bf273abfce057ffdd416d22"
#   ...
#   [2] $ curl -v -H 'If-None-Match: "25a98e5c7bf273abfce057ffdd416d22"' http://localhost:9292/

require 'rack/contrib'
require 'app/etag'

use Rack::ConditionalGet
use Rack::ContentLength
use Rack::ETag

run EtagApp.new
