# frozen_string_literal: true
require_relative "extension/extension_services_pb"

module MaiOgi
  # wraps all the things
  class ExtensionServer < Sensu::Rpc::Extension::Service
    def handle_event(handle_event_request, _unused_call)
      puts handle_event_request
      # Do things here then send it to response
      # Sensu::Rpc::HandleEventResponse.new()
    end
    
    def mutate_event(mutate_event_request, _unused_call)
      puts mutate_event_request
      # Do things here then send it to response
      # Sensu::Rpc::MutateEventResponse.new()
    end

    def filter_event(filter_event_request, _unused_call)
      # See https://github.com/sensu/sensu-go/blob/ec47268f81b59d4ef8f20952c282bf8198efcb74/types/event.proto
      # for info defined in event struct
      puts filter_event_request.event.timestamp
      #puts filter_event_request.event.entity.inspect
      #puts filter_event_request.event.check.inspect
      eval '([0,6].include?(Time.at(value).wday) || Time.at(value).hour.between?(1,14)) || (Time.at(value).wday==1 && Time.at(value).hour==0)'
      # Note that any exceptions raised here are swallowed by gRPC. They will
      # show in the sensu-backend logs as 'rpc error: code = Unknown desc = no
      # reason given'
      Sensu::Rpc::FilterEventResponse.new(filtered: false, error: "")
    end
  end
end
