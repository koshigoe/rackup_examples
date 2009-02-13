# = Rack::File
#
# Serving files.
#
# Rack::File looks like a Rack::Directory,
# but Rack::File does not serving index.

app = Rack::File.new('public')

run app
