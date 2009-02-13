# = Rack::URLMap
#
# Routing rules.

require 'app/foo'
require 'app/bar'

map '/foo' do
  run FooApp.new
end

map '/bar' do
  run BarApp.new
end
