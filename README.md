# custom-plugins
Init repo for setting up custom plugins in Javascript, Go and Python.

## Quickstart
- pull kong/kong-gateway:2.5.1.0-alpine docker image
- run docker build with name as kong/sales-engineering:custom-kong-1.0 (note the trailing .)
```
docker build -t kong/sales-engineering:custom-kong-1.0 .
```
- run /bin/setup_kong.sh