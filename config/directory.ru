# = Rack::Directory
#
# Serving files and index.
#
# If requested URI is found,
# return index or matched file contents.
#
# If requested URI is not found,
# return 404 Not Found.

dir = Rack::Directory.new('public')

run dir
