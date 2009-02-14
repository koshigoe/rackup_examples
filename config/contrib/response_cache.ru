# = Rack::ResponseCache
#
# > Caches responses to requests without query strings to Disk or
#   a user provider Ruby object. Similar to Rails’ page caching.
#
# NOTE:
#   Why cache file empty?
#   First writing is success. But next or after a few request, cache was empty.

require 'rack/contrib'
require 'app/dump'

cache_dir = File.join(File.dirname(__FILE__), '..', '..', 'public')

use Rack::ResponseCache, cache_dir

run Rack::Cascade.new([Rack::File.new('public'), DumpApp.new], [404])
