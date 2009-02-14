class EvilApp
  def call(env)
    response = [
      200,
      { 'Content-Type' => 'text/html; charset=UTF-8' },
      'output'
    ]
    throw :response, response
    response[2] = 'not output'
    response
  end
end
