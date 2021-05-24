#!/bin/bash

# Helm install charts in microk8s cluster. Use values from values.microk8s.

microk8s helm3 install aimrank-master ./charts/aimrank --values=./charts/aimrank/values.microk8s.yaml \
  --set postgres.volume.hostPath=$(pwd)/.volume/postgres \
  --set rabbitmq.volume.hostPath=$(pwd)/.volume/rabbitmq \
  --set aimrank-agones.volume.csgo=$(pwd)/Aimrank.Agones/container_data
