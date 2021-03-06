# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: entity.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "sensu.types.Entity" do
    optional :id, :string, 1
    optional :class, :string, 2
    optional :system, :message, 3, "sensu.types.System"
    repeated :subscriptions, :string, 4
    optional :last_seen, :int64, 5
    optional :deregister, :bool, 6
    optional :deregistration, :message, 7, "sensu.types.Deregistration"
    optional :keepalive_timeout, :uint32, 8
    optional :environment, :string, 9
    optional :organization, :string, 10
    optional :user, :string, 11
    optional :extended_attributes, :bytes, 12
    repeated :redact, :string, 13
  end
  add_message "sensu.types.System" do
    optional :hostname, :string, 1
    optional :os, :string, 2
    optional :platform, :string, 3
    optional :platform_family, :string, 4
    optional :platform_version, :string, 5
    optional :network, :message, 6, "sensu.types.Network"
    optional :arch, :string, 7
  end
  add_message "sensu.types.Network" do
    repeated :interfaces, :message, 1, "sensu.types.NetworkInterface"
  end
  add_message "sensu.types.NetworkInterface" do
    optional :name, :string, 1
    optional :mac, :string, 2
    repeated :addresses, :string, 3
  end
  add_message "sensu.types.Deregistration" do
    optional :handler, :string, 1
  end
end

module Sensu
  module Types
    Entity = Google::Protobuf::DescriptorPool.generated_pool.lookup("sensu.types.Entity").msgclass
    System = Google::Protobuf::DescriptorPool.generated_pool.lookup("sensu.types.System").msgclass
    Network = Google::Protobuf::DescriptorPool.generated_pool.lookup("sensu.types.Network").msgclass
    NetworkInterface = Google::Protobuf::DescriptorPool.generated_pool.lookup("sensu.types.NetworkInterface").msgclass
    Deregistration = Google::Protobuf::DescriptorPool.generated_pool.lookup("sensu.types.Deregistration").msgclass
  end
end
