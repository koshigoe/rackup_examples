# = Rack::Reloader
#
# Reload application when web server is running.
#
# If an aplication script file was modified,
# reload the script file.

require 'app/reloadable'

use Rack::Reloader

run ReloadableApp.new
