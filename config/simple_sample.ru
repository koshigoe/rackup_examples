# = Simple Example
#
# Default Middlewares only.

run Proc.new { |env|
  body = env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")
  [
    200,
    {
      'Content-Type' => 'text/html; charset=UTF-8',
      'Content-Length' => body.length.to_s,
    },
    [body]
  ]
}
