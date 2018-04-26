# frozen_string_literal: true
require "extension_server"

module MaiOgi
  # gRPC server
  class Server
    s = GRPC::RpcServer.new
    s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
    s.handle(MaiOgi::ExtensionServer)
    s.run_till_terminated
  end
end
