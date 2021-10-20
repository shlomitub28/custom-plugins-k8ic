FROM kong/kong-gateway:2.5.1.0-alpine

USER root

RUN apk update && apk add nodejs npm python3 python3-dev py3-pip go make g++

# Install kong js pdk
WORKDIR /kong-js-pdk

COPY /kong-js-pdk .

RUN rm -rf node_modules && npm i && npm link kong-pdk

# add kong go plugins
WORKDIR /kong-go-pdk

COPY ./kong-go-pdk .

WORKDIR /kong-go-pdk/plugins

RUN for file in *; do go build ${file}; done

RUN for file in *; do if [[ -x "$file" ]]; then cp ./${file} /usr/local/bin; fi; done

# add kong plython plugins
WORKDIR /kong-python-pdk

COPY ./kong-python-pdk .

RUN pip3 install kong-pdk