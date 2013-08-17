$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'hello'

transport = Thrift::BufferedTransport.new(Thrift::Socket.new('localhost', 9090))
protocol = Thrift::BinaryProtocol.new(transport)
demo = Demo::Hello::Client.new(protocol)
transport.open()

puts demo.helloString("-_-")

