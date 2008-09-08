require 'app/dump'

use Rack::Static, :urls => ['/'], :root => 'public'

# must run application?
run DumpApp.new
