#!/bin/bash

REPOSITORIES=(Aimrank.Pod Aimrank.Web Aimrank.Cluster)

for REPOSITORY in ${REPOSITORIES[@]}
do
  echo "============================================"
  echo "Pulling repository: $REPOSITORY"
  echo "============================================"
  cd $REPOSITORY
  git checkout master
  git pull
  cd ..
done