# = Rack::Deflater
#
# Compress content.
#
# e.g.
#
#   [1] $ rackup config/deflater.ru
#   [2] $ curl -H 'Accept-Encoding: gzip,deflate' http://localhost:9292/ | gzip -dc

use Rack::ContentLength
use Rack::Deflater

run Proc.new { |env|
  [
    200,
    {'Content-Type' => 'text/html; charset=UTF-8'},
    [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
  ]
}
