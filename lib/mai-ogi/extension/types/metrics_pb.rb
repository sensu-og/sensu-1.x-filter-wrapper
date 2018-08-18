# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: metrics.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "sensu.types.Metrics" do
    repeated :handlers, :string, 1
    repeated :points, :message, 2, "sensu.types.MetricPoint"
  end
  add_message "sensu.types.MetricPoint" do
    optional :name, :string, 1
    optional :value, :double, 2
    optional :timestamp, :int64, 3
    repeated :tags, :message, 4, "sensu.types.MetricTag"
  end
  add_message "sensu.types.MetricTag" do
    optional :name, :string, 1
    optional :value, :string, 2
  end
end

module Sensu
  module Types
    Metrics = Google::Protobuf::DescriptorPool.generated_pool.lookup("sensu.types.Metrics").msgclass
    MetricPoint = Google::Protobuf::DescriptorPool.generated_pool.lookup("sensu.types.MetricPoint").msgclass
    MetricTag = Google::Protobuf::DescriptorPool.generated_pool.lookup("sensu.types.MetricTag").msgclass
  end
end