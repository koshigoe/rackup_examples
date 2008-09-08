class BarApp
  def call(env)
    [200, {'Content-Type' => 'text/html; charset=UTF-8'}, [self.class.to_s]]
  end
end
