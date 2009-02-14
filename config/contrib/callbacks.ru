# = Rack::Callbacks
#
# > Implements DLS for pure before/after filter like Middlewares.

require 'rack/contrib'
require 'app/dump'

class BeforeApp
  def call(env)
    env['test.test'] = 1
  end
end

class AfterApp
  def call(response)
    response[2] = ['<body>', response[2], '</body>'].flatten
    response[1].merge!('Content-Length' => response[2].join.length.to_s)
    response
  end
end

app = Rack::Callbacks.new do
  before BeforeApp
  after AfterApp
  run DumpApp.new
end

run app
