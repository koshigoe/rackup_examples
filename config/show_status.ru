# = Rack::ShowStatus
#
# Replace empty response.
#
# NOTE:
#   When 'rack.showstatus.detail' exists,
#   response was replaced always if not empty.

use Rack::ShowStatus

run Proc.new { |env|
  env['rack.showstatus.detail'] = '<b>detail...</b>' # <- display
  [
    400,
    {'Content-Type' => 'text/html; charset=UTF-8'},
    ['400 Bad Request'], # <- not display
  ]
}
