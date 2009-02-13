# = Rack::ContentLength
#
# Set Content-Length header automatically.

use Rack::ContentLength

run Proc.new { |env|
  [
    200,
    {
      'Content-Type' => 'text/html; charset=UTF-8',
    },
    [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
  ]
}
