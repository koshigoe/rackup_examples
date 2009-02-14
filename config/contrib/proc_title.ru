# = Rack::ProcTitle
#
# > Displays request information in process title ($0)
#   for monitoring/inspection with ps(1).
#
# e.g.
#
#   $ ps aux | grep rackup
#   ... S+    3:31PM   0:00.36 rackup [rackup_examples/9292] (1) GET /
#   $ ps aux | grep rackup
#   ... S+    3:31PM   0:00.37 rackup [rackup_examples/9292] (2) GET /
#   $ ps aux | grep rackup
#   ... S+    3:31PM   0:00.51 rackup [rackup_examples/9292] (3) HEAD /

require 'rack/contrib'
require 'app/dump'

use Rack::ContentLength
use Rack::ProcTitle

run DumpApp.new
