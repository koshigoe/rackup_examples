class ConditionalGetApp
  def call(env)
    body = 'content'
    [
      200,
      {
        'ETag' => 'etag',
        'Last-Modified' => 'Wed, 15 Nov 1995 04:58:08 GMT',
        'Content-Type' => 'text/html; charset=UTF-8',
        'Content-Length' => body.length.to_s,
      },
      body,
    ]
  end
end
