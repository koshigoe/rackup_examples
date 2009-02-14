# = Rack::Config
#
# > Shared configuration for cooperative middleware.

require 'rack/contrib'
require 'app/dump'

use Rack::ContentLength
use Rack::Config do |env|
  env['test.config.rack'] = 1
end

run DumpApp.new
