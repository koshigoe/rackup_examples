# = Rack::NestedParams
#
# > parses form params with subscripts (e.g., * "post[title]=Hello")
#   into a nested/recursive Hash structure (based on Rails’ implementation).
#
# * env['rack.request.form_input'] is POST body.
# * env['rack.request.form_hash'] is nested params.
#
# e.g.
#
# $ curl --data 'v[x]=10&v[y]=20' http://localhost:9292/ 2>/dev/null
# --- !ruby/object:Rack::Lint::InputWrapper 
# input: !ruby/object:StringIO {}
# 
# --- 
# v: 
#   x: "10"
#   y: "20"

require 'rack/contrib'
require 'app/nested_params'

use Rack::ContentLength
use Rack::NestedParams

run NestedParamsApp.new
