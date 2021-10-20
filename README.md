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
- This project is deployed with helm, so ensure you have the latest kong chart from helm
```
helm repo add kong https://charts.konghq.com
helm repo update
```
- run setup_kong.sh
```
cd bin
./setup_kong.sh
```
- to tear down the environment, run delete_kong.sh
```
./delete_kong.sh
```
