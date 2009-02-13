# = Rack::Auth::Digest
#
# Digest authentication.
#
# see also: <rack>/test/spec_rack_auth_digest.rb

require 'app/dump'

protected_app = Rack::Auth::Digest::MD5.new(DumpApp.new) do |username|
  { 'user' => 'pass' }[username]
end
protected_app.realm = 'Rack::Auth::Digest::MD5'
protected_app.opaque = 'secret'

run protected_app
