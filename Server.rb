$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'hello'

class HelloHandler
  def helloString(s)
    s*3
  end
end

handler = HelloHandler.new
processor = Demo::Hello::Processor.new(handler)
transport = Thrift::ServerSocket.new(9090)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

puts "Starting the server..."
server.serve()
puts "done."