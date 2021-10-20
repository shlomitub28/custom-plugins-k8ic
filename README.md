# custom-plugins
Init repo for setting up custom plugins in Javascript, Go and Python.

## Quickstart
- This project is using helm to deploy kong in kubernetes. I typically run locally in my docker-desktop context.
- Ensure you have the latest Kong helm chart
```
helm repo add kong https://charts.konghq.com
helm repo update
```
- Pull kong/kong-gateway:2.5.1.0-alpine docker image
```
docker pull kong/kong-gateway:2.5.1.0-alpine
```
- Run docker build from project root with name as kong/sales-engineering:custom-kong-1.0 (note the trailing .)
```
docker build -t kong/sales-engineering:custom-kong-1.0 .
```
- Run setup_kong.sh to deploy and run kong
```
cd bin
./setup_kong.sh
```
- To tear down the environment, run delete_kong.sh
```
./delete_kong.sh
```

## Environment
- Once the environment is up and running, both Kong Manager and the Admin API can be accessed on localhost for testing.
- The base configuration has a few plugins added: js-hello, py-hello and go-hello. This can be verfied via Kong Manager or the Admin API:
![manager](https://user-images.githubusercontent.com/11033758/138120585-5bb30567-abaa-48e6-916c-64c8daedd9ff.png)
![adminapi](https://user-images.githubusercontent.com/11033758/138120631-c8294e8f-6498-4536-a734-02f69811691b.png)
