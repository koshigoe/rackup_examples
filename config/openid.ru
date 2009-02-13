# = Rack::Auth::OpenID
#
# OpenID authentication.
#
# NOTE:
#   This example is for testing.
#   Probably, this is not correct way.
#
# == Setup and Run demo OP
#
#   (console):
#   $ wget http://openidenabled.com/files/ruby-openid/packages/ruby-openid-2.1.2.tar.bz2
#   $ tar xjvf ruby-openid-2.1.2.tar.bz2
#   $ cd ruby-openid-2.1.2/examples/rails_openid
#   $ rake rails:update
#   $ script/server
#   $ cp config/environment.rb config/environment.rb.orig
#   $ vi config/environment.rb
#   $ diff config/environment.rb.orig config/environment.rb
#   --- config/environment.rb.orig  2008-09-13 01:31:02.000000000 +0900
#   +++ config/environment.rb       2008-09-13 01:34:10.000000000 +0900
#   @@ -23,6 +23,7 @@
#      # Use the database for sessions instead of the file system
#      # (create the session table with 'rake create_sessions_table')
#      # config.action_controller.session_store = :active_record_store
#   +  config.action_controller.session = { :session_key => "_myapp_session", :secret => '1ee3b8923cffd103007e8aa3428b60ed' }
#    
#      # Enable page/fragment caching by setting a file-based store
#      # (remember to create the caching directory and make it readable to the application)
#   $ mkdir db
#   $ sqlite3 -batch db/development.sqlite3 --
#   $ script/server
#
# == Check OpenID authentication
#
#   (Web Browser):
#   http://127.0.0.1:9292/?openid_identifier=http://127.0.0.1:3000
#     -> redirected to OP (Show: Do you trust this site with your identity?)
#     -> input identifier and click 'yes' button.
#     -> -> redirected to RP (:login_good)
#
# == How convert OpenID::Message to String ?
#
# NOTE:
#   This problem was resolved, when following environments.
#     * rack-0.9.1 (installed version)
#     * ruby-openid-2.1.4 (installed version)
#     * ruby-openid-2.1.2 (demo use)
#   I didn't examine why resolved it.
#
# At <lib/rack/auth/openid.rb:383>, instance of OpenID::Message was append to response body.
# So, this response is invalid about Rack Protocol.
# Authentication is successful, but response is 500 Internal Server Error.
#
# I commented out that line, see following different.
#
# --- lib/rack/auth/openid.rb.orig        2008-09-13 03:52:39.000000000 +0900
# +++ lib/rack/auth/openid.rb     2008-09-13 03:52:50.000000000 +0900
# @@ -380,7 +380,7 @@
#              '='+o_id
#            body << "Reauthentication required.\n"
#          end
# -        body << oid.message if oid.message
# +        #body << oid.message if oid.message
#          [ 303, {'Location'=>goto}, body]
#        end
#  

require 'app/foo'

use Rack::Session::Cookie

map '/' do
  run Rack::Auth::OpenID.new('http://127.0.0.1:9292/', :login_good => 'http://127.0.0.1:9292/foo')
end

map '/foo' do
  run FooApp.new
end
