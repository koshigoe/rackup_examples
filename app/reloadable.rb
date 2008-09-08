class ReloadableApp
  def call(env)
    ['200', { 'Content-Type' => 'text/html; charset=UTF-8'}, ['ab']]
  end
end
