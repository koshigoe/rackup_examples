# = Rack::ContentType
#
# Set Content-Type header automatically.
#
# NOTE:
#   Rack::ContentType is loaded by Rack::Handler:*.
#   (commit: c82590723025c7f51c2bfa246225263d1971f179)

use Rack::ContentType, 'text/plain'

run Proc.new { |env|
  [
    200,
    {}, # Content-Length will be set automatically.
    "plain text"
  ]
}
