require "webrick"
require "./lib/message.rb"

srv = WEBrick::HTTPServer.new({
  BindAddress:    "0.0.0.0",
  Port: 8080
})


srv.mount_proc '/' do |req, res|
  # message arguments 2 (gpio, radius)
  message = Message.new(4, req.query["rad"])
  message.send
  res.body = req.query["rad"]
  res.status = 200
end


srv.start

