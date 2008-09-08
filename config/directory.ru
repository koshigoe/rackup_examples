# see: lib/rack/directory.rb:43
#   @app is always defined (because of: @app = app).
#   Rack::File never set to @app.
#   So must set second argument of RackDirectory::new
#
# # This application is invalid on rack 0.4.0.
# dir = Rack::Directory.new('public')
#
# run dir

# If requested URI is found, return directory index or file contents.
# If requested URI is not found, return 404 Not Found.
dir = Rack::Directory.new('public', Rack::File.new('public'))

run dir
