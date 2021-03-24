#!/bin/bash

docker network create trio-task-network

docker volume create trio-task-db

docker build -t trio-task-mysql db
docker build -t trio-task-flask-app flask-app

docker run -d \
    --name mysql \
    -e MYSQL_ROOT_PASSWORD=password \
    -e MYSQL_DATABASE=flask-db \
    --volume trio-task-db \
    trio-task-mysql

docker run -d \
    --name flask-app \
    trio-task-flask-app

docker run -d \
    --name nginx \
    -p 80:80 \
    --mount type=bind,source=$(pwd)/nginx.conf,target=/etc/nginx/nginx.conf \
    nginx