#!/bin/bash
# Builds the container and drops to the shell, for experimentation.
docker stop loginsrv-db;
docker rm loginsrv-db;
docker build -t loginsrv-db . && \
docker run --name loginsrv-db -d -e POSTGRES_HOST_AUTH_METHOD=trust loginsrv-db && \
docker exec -it loginsrv-db /bin/bash
