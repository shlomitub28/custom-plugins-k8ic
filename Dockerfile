FROM kong/kong-gateway:2.7.0.0-alpine

USER root

RUN apk update && apk add nodejs npm go python3 py3-pip python3-dev musl-dev libffi-dev gcc g++ file make \
&& npm install -g kong-pdk && PYTHONWARNINGS=ignore pip3 install kong-pdk

# Install kong js pdk
WORKDIR /kong-js-pdk

COPY /kong-js-pdk/plugins .

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

#RUN PYTHONWARNINGS=ignore pip3 install kong-pdk

USER kong