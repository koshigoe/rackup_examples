class ExceptionApp
  def call(env)
    raise StandardError.new("The example of Rack::MailException")
  end
end
