# = Rack::CommonLogger
#
# Common logger.
#
# e.g.
#
#   ::1 - - [13/Feb/2009 21:45:32] "GET / HTTP/1.1" 200 1154 0.0056
#
# NOTE:
#   If environment is 'development' or 'deployment',
#   Rack::CommonLogger will be used default.
#   Then logger is STDERR.
#
#   But, if 'server.name' matches /CGI/, Rack::CommonLogger is not used.

require 'app/dump'

log = open(File.join(File.dirname(__FILE__), '..', 'tmp', 'example.log'), "a")
log.sync = true
use Rack::CommonLogger, log

run DumpApp.new
