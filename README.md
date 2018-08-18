## Vagrant quickstart

```
vagrant up
```

This will install sensu-backend, agent, and cli, and create a handler and an
extension called `ruby-grpc` that calls the gRPC service for filtering. The
gRPC service itself is not started automatically.

### Start the Ruby gRPC service
```
vagrant ssh -c 'cd /shim && bundle console'
```
`bundle console` imports the gem which in turn starts the gRPC service on port
50051. The gRPC service is defined in lib/mai-ogi/server.rb, and uses handlers
defined in lib/mai-ogi/extension_server.rb. Hit Ctrl+C twice to stop the gRPC
service.

### Hack on the filter

Edit code in the `filter_event` method of lib/mai-ogi/extension-server.rb.
Further details are provided in the comments of the filter_event method.
Restart the gRPC service to apply changes.

### Watch the backend logs

(from another console)
```
vagrant ssh -c 'sudo journalctl -fu sensu-backend'
```

gRPC handled check runs every 5 seconds.
