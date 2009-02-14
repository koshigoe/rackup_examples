require 'yaml'

class NestedParamsApp
  def call(env)
    body = [
             env['rack.request.form_input'].to_yaml,
             env['rack.request.form_hash'].to_yaml,
           ]
    [
      200,
      { 'Content-Type' => 'text/plain; charset=UTF-8'},
      body
    ]
  end
end
