class SessionApp
  def call(env)
    env['rack.session'].merge!(Time.now.to_s => true)
    [200, {'Content-Type' => 'text/html; charset=UTF-8'}, [env['rack.session']]]
  end
end
