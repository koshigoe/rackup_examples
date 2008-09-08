require 'app/obsoluted'
require 'app/foo'

use Rack::Recursive

map '/foo' do
  run FooApp.new
end

map '/' do
  run ObsolutedApp.new
end
