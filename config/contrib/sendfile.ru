# = Rack::Sendfile
#
# > Enables X-Sendfile support for bodies that can be served from file.

require 'rack/contrib'

use Rack::ContentLength
use Rack::Sendfile

run Proc.new { |env|
  env['sendfile.type'] = 'X-Sendfile'
  path = File.join(File.dirname(__FILE__), '../../README.rdoc')
  def path.to_path; self; end
  [200, {'Content-Type' => 'text/plain'}, path]
}
