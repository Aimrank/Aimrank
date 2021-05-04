#!/bin/bash

CR_PAT="$1"
CR_USER="$2"

printf $CR_PAT | docker login ghcr.io -u $CR_USER --password-stdin

cd /home/debian/Aimrank

docker image rm ghcr.io/aimrank/aimrank-web:latest
docker image rm ghcr.io/aimrank/aimrank-pod:latest
docker image rm ghcr.io/aimrank/aimrank-cluster:latest

echo "Starting all services"

sudo docker-compose -f compose/docker-compose.yml -f compose/docker-compose.production.yml down
sudo docker-compose -f compose/docker-compose.yml -f compose/docker-compose.production.yml up -d

echo "Services started"
