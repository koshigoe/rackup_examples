class EtagApp
  def call(env)
     [
       200,
       {
         'Content-Type' => 'text/html; charset=UTF-8',
       },
       'type of body must be string'
     ]
  end
end
