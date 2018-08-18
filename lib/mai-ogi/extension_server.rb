# frozen_string_literal: true
require_relative "extension/extension_services_pb"

module MaiOgi
  # wraps all the things
  class ExtensionServer < Sensu::Rpc::Extension::Service
    def handle_event(handle_event_request, _unused_call)
      puts handle_event_request
      # Do things here then send it to response
      # Sensu::Rpc::Extension::HandleEventResponse.new()
    end
    
    def mutate_event(mutate_event_request, _unused_call)
      puts mutate_event_request
      # Do things here then send it to response
      # Sensu::Rpc::Extension::MutateEventResponse.new()
    end

    def filter_event(filter_event_request, _unused_call)
      puts filter_event_request
      # Do things here then send it to response
      # Sensu::Rpc::Extension::FilterEventResponse.new()
    end
  end
end
