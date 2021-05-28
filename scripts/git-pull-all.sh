#!/bin/bash

REPOSITORIES=(Aimrank.Web Aimrank.Agones Aimrank.Agones.Cluster)

for REPOSITORY in ${REPOSITORIES[@]}
do
  echo "============================================"
  echo "Pulling repository: $REPOSITORY"
  echo "============================================"
  cd $REPOSITORY
  git checkout master
  git pull
  git checkout -
  cd ..
done