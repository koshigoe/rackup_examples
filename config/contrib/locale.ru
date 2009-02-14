# = Rack::Locale
#
# > Detects the client locale using the Accept-Language request header
#   and sets a rack.locale variable in the environment.
#
# NOTE:
#   I can't use Rack::Locale.
#   I don't know how to get i18n.
#
# == Requirements
#
# * i18n

require 'rack/contrib'

use Rack::ContentLength
use Rack::Locale

run Proc.new { |env|
  [
    200,
    {
      'Content-Type' => 'text/html; charset=UTF-8',
    },
    env['rack.locale'],
  ]
}
