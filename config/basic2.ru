# = Rack::Auth::Basic
#
# Basic authentication, part 2.
#
# Protect only specified applications, using basic authentication.
#
# see also: config/basic.ru

require 'app/dump'
require 'app/foo'

use Rack::ShowStatus

protected_app = Rack::Auth::Basic.new(DumpApp.new) do |username, password|
  auth_db = {
    'user' => 'pass'
  }
  auth_db.has_key?(username) and password == auth_db[username]
end

map '/' do
  run protected_app
end

map '/foo' do
  run FooApp.new
end
