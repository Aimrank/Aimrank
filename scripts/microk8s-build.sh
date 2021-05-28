#!/bin/bash

# Build docker images and push them to microk8s images registry.

AIMRANK_WEB=localhost:32000/aimrank-web:local
AIMRANK_AGONES=localhost:32000/aimrank-agones:local
AIMRANK_AGONES_CLUSTER=localhost:32000/aimrank-agones-cluster:local

docker build -t $AIMRANK_WEB ./Aimrank.Web && docker push $AIMRANK_WEB
docker build -t $AIMRANK_AGONES ./Aimrank.Agones && docker push $AIMRANK_AGONES
docker build -t $AIMRANK_AGONES_CLUSTER ./Aimrank.Agones.Cluster && docker push $AIMRANK_AGONES_CLUSTER

