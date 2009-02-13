# = Rack::Recursive
#
# Call chain.
#
# Maybe, Rack::Recursive looks like to mod_rewrite.

require 'app/obsoluted'
require 'app/foo'

use Rack::Recursive

map '/foo' do
  run FooApp.new
end

map '/' do
  run ObsolutedApp.new
end
