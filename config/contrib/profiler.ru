# = Rack::Profiler
#
# > Uses ruby-prof to measure request time.
#
# e.g.
#
#   http://localhost:9292/?profile=<measure_mode>
#
#   About <measure_mode>, see RubyProf.
#
# == Requirements
#
# * ruby-prof

require 'rack/contrib'
require 'app/dump'

use Rack::ContentLength
use Rack::Profiler

run DumpApp.new
