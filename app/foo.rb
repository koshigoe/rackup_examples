class FooApp
  def call(env)
    body = self.class.to_s
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
