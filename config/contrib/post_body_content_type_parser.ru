# = Rack::PostBodyContentTypeParser
#
# > Adds support for JSON request bodies.
#   The Rack parameter hash is  populated by
#   deserializing the JSON data provided in
#   the request body when the Content-Type
#   is application/json.
#
# e.g.
#
#  $ curl -v --data '{ "v": { "x": 10, "y": 20 } }' -H 'Content-Type: application/json' http://localhost:9292/
#
# == Requirements
#
# * json

require 'rack/contrib'
require 'app/nested_params'

use Rack::ContentLength
use Rack::PostBodyContentTypeParser

run NestedParamsApp.new
