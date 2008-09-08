# deployment environment
use Rack::ShowExceptions # <- try on/off
use Rack::Lint

run Proc.new { |env|
  [
    200,
    # {'Content-Type' => 'text/html; charset=UTF-8'},
    {},
    [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
  ]
}

