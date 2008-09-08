class ObsolutedApp
  def call(env)
    raise Rack::ForwardRequest.new('/foo')
  end
end
