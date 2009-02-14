# = Rack::Evil
#
# > Lets the rack application return a response to
#   the client from any place.

require 'rack/contrib'
require 'app/evil'

use Rack::ContentLength
use Rack::Evil

run EvilApp.new
