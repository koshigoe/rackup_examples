# not allow development environment (Rack::Lint::LintError)
# use deployment environment.
require 'app/dump'

protected_app = Rack::Auth::Basic.new(DumpApp.new) do |username, password|
  auth_db = {
    'user' => 'pass'
  }
  auth_db.has_key?(username) and password == auth_db[username]
end

run protected_app
