class ReloadableApp
  def call(env)
    body = 'abc'
    [
      '200',
      {
        'Content-Type' => 'text/html; charset=UTF-8',
        'Content-Length' => body.length.to_s,
      },
      body,
    ]
  end
end
