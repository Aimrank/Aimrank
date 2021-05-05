#!/bin/bash

CR_PAT="$1"
CR_USER="$2"

COMPOSE_FILES="-f compose/docker-compose.yml -f compose/docker-compose.production.yml"
COMPOSE_ENV="--env-file ../docker.env"

printf $CR_PAT | docker login ghcr.io -u $CR_USER --password-stdin

cd /home/debian/Aimrank

echo "Stopping all services"

sudo docker-compose $COMPOSE_ENV $COMPOSE_FILES down

docker image rm ghcr.io/aimrank/aimrank-web:latest
docker image rm ghcr.io/aimrank/aimrank-pod:latest
docker image rm ghcr.io/aimrank/aimrank-cluster:latest

echo "Starting all services"

sudo docker-compose $COMPOSE_ENV $COMPOSE_FILES up -d

echo "Services started"
