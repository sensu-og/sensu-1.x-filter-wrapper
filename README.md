## Vagrant quickstart

```
vagrant up
```

This will install sensu-backend, agent, and cli, and create a handler and an
extension called `ruby-grpc` that calls the gRPC service for filtering. The
gRPC service itself is not started automatically.

### Start the Ruby gRPC service
```
vagrant ssh -c 'cd /shim && bundle console /shim/test-filters.json'
```
`bundle console` imports the gem which in turn starts the gRPC service on port
50051. The gRPC service is defined in [server.rb](lib/mai-ogi/server.rb), and uses handlers
defined in [extension_server.rb](lib/mai-ogi/extension_server.rb). It takes one command line argument,
which is the path to the 1.x filters json that's being wrapped.

Example output:
```
expression       :  require 'net/http'; value == nil || '200' == Net::HTTP.get_response(URI.parse(value.to_s)).code rescue false
evaluated against: http://unreachable.local
returns          : false
expression       :  require 'net/http'; value == nil || '200' == Net::HTTP.get_response(URI.parse(value.to_s)).code rescue false
evaluated against: https://www.google.com/
returns          : true
```

Hit Ctrl+C to stop the gRPC service.

### Hack on the filter

Edit code in the `filter_event` method of lib/mai-ogi/extension-server.rb.
Restart the gRPC service to apply changes.

### Watch the backend logs

(from another console)
```
vagrant ssh -c 'sudo journalctl -fu sensu-backend'
```

gRPC handled check runs every 5 seconds.

### Known issues

- Despite the fact that `sensuctl configure ...` is ran successfully from the
  vagrant provisioner, running sensuctl commands interactively on the vagrant
  instance will tell you that sensuctl is not configured.
- No deep merge on event attributes for filters.
- Filter `negate` attribute is ignored.
- Filter expression evaluation is NOT ran in a sandbox
