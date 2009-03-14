# = Rack::Chunked
#
# Transfer-Encoding: chunked
#
# == Sample
# $ telnet localhost 9292
# Trying ::1...
# Connected to localhost.
# Escape character is '^]'.
# GET / HTTP/1.1
# Host: localhost:9292
# 
# HTTP/1.1 200 OK 
# Connection: Keep-Alive
# Content-Type: text/html
# Date: Sat, 14 Mar 2009 15:06:35 GMT
# Server: WEBrick/1.3.1 (Ruby/1.8.7/2008-08-11)
# Content-Length: 222
# Transfer-Encoding: chunked
# 
# 1
# *
# 2
# **
# 3
# ***
# 4
# ****
# 5
# *****
# 6
# ******
# 7
# *******
# 8
# ********
# 9
# *********
# a
# **********
# b
# ***********
# c
# ************
# d
# *************
# e
# **************
# f
# ***************
# 10
# ****************
# 0
# 

use Rack::Chunked

run Proc.new { |env|
  body = 1.upto(16).map { |n| "%s" % ['*' * n] }
  [
    200,
    {
      'Content-Type' => 'text/html',
    },
    body
  ]
}
