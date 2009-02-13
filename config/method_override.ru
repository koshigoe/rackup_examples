# = Rack::MethodOverride
#
# Method Override.
#
# If sent data included '_method=<METHOD>' from POST request,
# override HTTP METHOD.
#
# e.g.
#
#   $ curl -v --data '_method=GET' http://localhost:9292/
#   $ curl -v --data '_method=POST' http://localhost:9292/
#   $ curl -v --data '_method=PUT' http://localhost:9292/
#   $ curl -v --data '_method=DELETE' http://localhost:9292/

require 'app/method_override'

use Rack::MethodOverride

run MethodOverrideApp.new
