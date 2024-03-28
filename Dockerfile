FROM postgres:latest

WORKDIR /
COPY ./build/custom_entripoint/ /usr/local/bin/

COPY ./build/init/ /docker-entrypoint-initdb.d/init/
COPY ./build/migration/ /docker-entrypoint-initdb.d/migration/

RUN chmod -R +x /docker-entrypoint-initdb.d/

RUN apt-get update
RUN apt-get install -y jq