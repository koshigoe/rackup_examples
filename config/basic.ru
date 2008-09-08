# not allow development environment (Rack::Lint::LintError)
# use deployment environment.
use Rack::Auth::Basic do |username, password|
  auth_db = {
    'user' => 'pass'
  }
  auth_db.has_key?(username) and password == auth_db[username]
end

run Proc.new { |env|
  [
    200,
    {'Content-Type' => 'text/html; charset=UTF-8'},
    [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
  ]
}

