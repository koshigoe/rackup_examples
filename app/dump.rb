class DumpApp
  def call(env)
    [
      200,
      {'Content-Type' => 'text/html; charset=UTF-8'},
      [env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")]
    ]
  end
end