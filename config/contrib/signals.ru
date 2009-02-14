# = Rack::Signals
#
# > Installs signal handlers that are safely processed after a request
#
# NOTE:
#   The origin of this example is rack/contrib/signals.rb
#
# e.g.
#
#   [1] $ rackup config/contrib/signals.ru
#
#   [2] $ ps aux | grep "[r]ackup"
#   [2] koshigoe  2169   0.0 ...
#   [2] $ kill -USR1 2169
#
#   [1] [2009-02-14 19:43:55] INFO  WEBrick::HTTPServer#start: pid=2169 port=9292
#   [1] Exiting when ready

require 'rack/contrib'
require 'app/dump'

app = Rack::Signals.new(DumpApp.new) do
  trap 'INT', lambda {
    puts "Exiting now"
    exit! 0
  }

  trap_when_ready 'USR1', lambda {
    puts "Exiting when ready"
    exit! 0
  }
end

run app
