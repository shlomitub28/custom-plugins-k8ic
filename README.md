# custom-plugins
Init repo for setting up custom plugins in Javascript, Go and Python.

## Quickstart
- pull kong/kong-gateway:2.5.1.0-alpine docker image
```
docker pull kong/kong-gateway:2.5.1.0-alpine
```
- run docker build from project root with name as kong/sales-engineering:custom-kong-1.0 (note the trailing .)
```
docker build -t kong/sales-engineering:custom-kong-1.0 .
```
- run setup_kong.sh
```
cd bin
./setup_kong.sh
```
