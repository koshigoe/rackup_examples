# = Rack::ShowExceptions
#
# Show debug screen, when caught exception.
#
# NOTE:
#   When environment is 'development',
#   Rack::ShowExceptions was loaded automatically.
#
# Use 'deployment' environment to testing this example.

#use Rack::ShowExceptions # <- try on/off
use Rack::Lint

run Proc.new { |env|
  [
    200,
    {},
    [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
  ]
}

