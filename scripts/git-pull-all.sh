#!/bin/bash

REPOSITORIES=(Aimrank.Pod Aimrank.Web)

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