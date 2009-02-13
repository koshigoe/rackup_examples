# Dump 'env' object.
class DumpApp
  def call(env)
    body = env.map { |key, value| Rack::Utils.escape_html("#{key}=#{value}")}.join("<br />\n")
    [
      200,
      {
        'Content-Type' => 'text/html; charset=UTF-8',
        'Content-Length' => body.length.to_s,
      },
      [body]
    ]
  end
end
