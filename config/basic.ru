# = Rack::Auth::Basic
#
# Basic authentication, part 1.
#
# Protect whole requests, using basic authentication.
#
# see also: config/basic2.ru
#
# NOTE:
#   Rack::Auth::Basic is NOT set 'Content-Type' header.
#   When using 'development' environment,
#   Rack::Lint will load automatically.

require 'app/dump'

use Rack::ShowStatus
use Rack::Auth::Basic do |username, password|
  auth_db = {
    'user' => 'pass'
  }
  auth_db.has_key?(username) and password == auth_db[username]
end

run DumpApp.new
