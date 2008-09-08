# When environment is development, Rack::Lint is always used.
use Rack::Lint

# must set Content-Type header.
# raise Rack::Lint::LintError
run Proc.new { |env|
  [
    200,
    # {'Content-Type' => 'text/html; charset=UTF-8'},
    {},
    [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
  ]
}
