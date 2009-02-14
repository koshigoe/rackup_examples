# = Rack::TimeZone
#
# > Detects the clients timezone using JavaScript and sets a
#   variable in Rack's environment with the offset from UTC.

require 'rack/contrib'

use Rack::ContentLength
use Rack::TimeZone

run Proc.new { |env|
  body = <<-HTML
<html>
<head>
<script type="text/javascript">
#{Rack::TimeZone::Javascript}
</script>
</head>
<body onload="setTimezoneCookie();">
#{env["rack.timezone.utc_offset"]}
</body>
HTML
  [
    200,
    { 'Content-Type' => 'text/html; charset=UTF-8' },
    body
  ]
}
