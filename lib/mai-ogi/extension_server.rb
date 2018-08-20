# frozen_string_literal: true
require_relative "extension/extension_services_pb"
require 'json'

module MaiOgi
  # wraps all the things
  class ExtensionServer < Sensu::Rpc::Extension::Service
    def initialize(filters_json_path)
      filters_json = File.read(filters_json_path)
      @filters = JSON.parse(filters_json)['filters']
    end

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

      # proof-of-concept level 1.x filtering logic provided here
      filtered = false
      begin
        @filters.each do |filter_name, filter_attrs|
          filter_attrs['attributes'].each do |target_obj, filter|
            obj = filter_event_request.event[target_obj]
            filter.each do |attr, expr|
              if expr.start_with?("eval:")
                expr = expr[5..-1]
                value = obj[attr]
                filtered = eval expr
                puts "expression       : #{expr}"
                puts "evaluated against: #{value}"
                puts "returns          : #{filtered}"
              else
                raise "unsupported filter expression: #{expr}"
              end
            end
          end
        end
      rescue StandardError => error
        # Note: any exceptions not caught here are swallowed by gRPC and sent
        # to sensu-backend as an unknown error. They will show in the
        # sensu-backend logs as 'rpc error: code = Unknown desc = no reason
        # given'
        puts "error encountered while evaluating filter: #{error}"
        Sensu::Rpc::FilterEventResponse.new(filtered: false, error: error)
      else
        # TODO handle negate
        Sensu::Rpc::FilterEventResponse.new(filtered: filtered, error: "")
      end
    end
  end
end
