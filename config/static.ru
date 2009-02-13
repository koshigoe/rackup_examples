# = Rack::Static
#
# Serving static contents, when request uri matched
# defined prefix.
#
# e.g.
#
#   http://localhost:9292/
#     => Not match '/static'
#     => DumpApp
#
#   http://localhost:9292/static/foo
#     => Match '/static'
#     => file 'public/static/foo' exists
#     => public/static/foo
#
#   http://localhost:9292/static/foo
#     => Match '/static'
#     => file 'public/static/bar' does not exist
#     => 404 Not Found

require 'app/dump'
require 'app/foo'
require 'app/bar'

use Rack::Static, :urls => ['/static'], :root => 'public'

map '/' do
  run DumpApp.new
end

map '/static/foo' do
  run FooApp.new
end

map '/static/bar' do
  run BarApp.new
end
