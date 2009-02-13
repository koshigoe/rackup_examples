class MethodOverrideApp
  def call(env)
    body = env['REQUEST_METHOD']
    [
      200,
      {
        'Content-Type' => 'text/html; charset=UTF-8',
        'Content-Length' => body.length.to_s,
      },
      body
    ]
  end
end
