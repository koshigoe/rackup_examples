# = Rack::Lint
#
# Validates applications.
#
# NOTE:
#   When environment is 'development',
#   Rack::Lint was loaded automatically.
#
# If application was invalid,
# you will catch Rack::Lint::LintError.

use Rack::Lint

run Proc.new { |env|
  [
    200,
    # MUST be set some headers.
    {},
    [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
  ]
}
