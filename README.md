## Vagrant quickstart

```
vagrant up
```

TODO see comments in Vagrantfile provisioner

Watch the backend logs
```
vagrant ssh -c 'sudo journalctl -fu sensu-backend'
```

gRPC handled check runs every 5 seconds.

