# = Rack::Cascade
#
# Cascading request.
#
# e.g.
#
# http://localhost:9292/
#   => 404 Not Found
#   => Rack::Cascade catch 404 status code
#   => DumpApp was specified
#   => dispatch DumpApp
#
# http://localhost:9292/readme.txt
#   => 200 OK
#   => public/readme.txt

require 'app/dump'

run Rack::Cascade.new([Rack::File.new('public'), DumpApp.new], [404])
