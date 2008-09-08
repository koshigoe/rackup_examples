require 'app/dump'

app = Rack::Cascade.new([Rack::File.new('public'), DumpApp.new], [404])

run app
