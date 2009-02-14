# = Rack::JSONP
#
# > Adds JSON-P support by stripping out the callback param and
#   padding the response with the appropriate callback format.
#
# e.g.
#
#   $ curl -v "http://localhost:9292/"
#   $ curl -v "http://localhost:9292/?callback=func"

require 'rack/contrib'

use Rack::ContentLength
use Rack::JSONP

run Proc.new { |env|
  body = '{}'
  [
    200,
    {
      'Content-Type' => Rack::Mime.mime_type('.json'),
    },
    body,
  ]
}
