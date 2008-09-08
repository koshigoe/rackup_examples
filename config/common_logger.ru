# logger must respond to <<
# NOTE:
#   If environment is development or deployment, Rack::CommonLogger is used.
#   Then logger is STDERR.
#   But, if server.name matches /CGI/, Rack::CommonLogger is not used.
log = open('tmp/log', "a")
log.sync = true
use Rack::CommonLogger, log

run Proc.new { |env|
  [
    200,
    {'Content-Type' => 'text/html; charset=UTF-8'},
    [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
  ]
}
