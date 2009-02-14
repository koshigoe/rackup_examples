# = Rack::RelativeRedirect
#
# > Transforms relative paths in redirects to absolute URLs.
#
# e.g.
#
#   $ curl -v http://localhost:9292/ 2>&1 | grep Location
#   < Location: http://localhost:9292/readme.txt
#

require 'rack/contrib'

use Rack::RelativeRedirect

run Proc.new { |env|
  [
    301,
    { 'Location' => '/readme.txt' },
    []
  ]
}
