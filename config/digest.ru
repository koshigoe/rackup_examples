# not allow development environment (Rack::Lint::LintError)
# use deployment environment.
unprotected_app = Proc.new { |env|
  [
    200,
    {'Content-Type' => 'text/html; charset=UTF-8'},
    [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
  ]
}

# see: test/spec_rack_auth_digest.rb
protected_app = Rack::Auth::Digest::MD5.new(unprotected_app) do |username|
  {
    'user' => 'pass'
  }[username]
end
protected_app.realm = 'Rack::Auth::Digest::MD5'
protected_app.opaque = 'secret'

run protected_app
