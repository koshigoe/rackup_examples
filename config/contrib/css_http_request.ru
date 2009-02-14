# = Rack::CSSHTTPRequest
#
# > Adds CSSHTTPRequest support by encoding responses
#   as CSS for cross-site AJAX-style data loading
#
# NOTE:
#   I can't find 'csshttprequest' required Rack::CSSHTTPRequest.
#   So, this example has not been tested yet.
#
# == Requirements
#
# * csshttprequest

require 'rack/contrib'

use Rack::ContentLength
use Rack::CSSHTTPRequest

run Proc.new { |env|
  [
    200,
    {},
    "#c0 { background: url(data:,Hello%20World!); }"
  ]
}
