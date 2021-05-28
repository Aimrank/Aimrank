#!/bin/bash

# Build docker images and push them to microk8s images registry.

AIMRANK_WEB=localhost:32000/aimrank-web:local
AIMRANK_AGONES=localhost:32000/aimrank-agones:local
AIMRANK_AGONES_CLUSTER=localhost:32000/aimrank-agones-cluster:local

cd Aimrank.Web && docker build -t $AIMRANK_WEB . && docker push $AIMRANK_WEB && cd ..
cd Aimrank.Agones && docker build -t $AIMRANK_AGONES . && docker push $AIMRANK_AGONES && cd ..
cd Aimrank.Agones.Cluster && docker build -t $AIMRANK_AGONES_CLUSTER . && docker push $AIMRANK_AGONES_CLUSTER && cd ..
