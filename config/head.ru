# = Rack::Head
#
# Accept HEAD method.
#
# e.g.
#
#   $ lwp-request -e -m HEAD http://localhost:9292/

require 'app/dump'

use Rack::Head

run DumpApp.new
