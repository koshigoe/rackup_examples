require 'app/reloadable'

use Rack::Reloader

# modify application script during running web server.
run ReloadableApp.new
