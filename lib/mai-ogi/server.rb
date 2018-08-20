# frozen_string_literal: true
require_relative "extension_server"

module MaiOgi
  # gRPC server
  class Server
    if ARGV.size != 2
      puts "usage: #{ARGV[0]} /path/to/1.x/filters.json"
      return
    end
    s = GRPC::RpcServer.new
    s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
    s.handle(MaiOgi::ExtensionServer.new(ARGV[1]))
    s.run_till_terminated
  end
end
