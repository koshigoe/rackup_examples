# = Rack::MailExceptions
#
# > Rescues exceptions raised from the app and sends
#   a useful email with the exception, stacktrace,
#   and contents of the environment.
#
# == Requirements
#
# * net/smtp
# * tmail
# * erb
# * tlsmail (Ruby 1.8.7-)

require 'rack/contrib'
require 'app/dump'
require 'app/exception'

require "tlsmail"
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

use Rack::ContentLength

use Rack::MailExceptions do |app|
  app.to('<account>@gmail.com')
  app.from('rackup_examples')
  app.subject('[rackup_examples] MailExceptions')
  app.smtp(
           :address        => 'smtp.gmail.com',
           :domain         => 'localhost',
           :port           => 587,
           :authentication => :login,
           :user_name      => '<gmail account>',
           :password       => '<gmail password>'
           )
end

map '/no_exception' do
  run DumpApp.new
end

map '/exception' do
  run ExceptionApp.new
end
