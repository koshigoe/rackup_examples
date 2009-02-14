# = Rack::NotFound
#
# > A default 404 application.
#
# I don't know how to use this.
#
# NOTE:
#   Same as Rack::Cascade ?

require 'rack/contrib'
require 'app/dump'

use Rack::ContentLength

not_found_app = Rack::NotFound.new('public/404.html')
run Rack::Cascade.new([Rack::File.new('public'), not_found_app], [404])
