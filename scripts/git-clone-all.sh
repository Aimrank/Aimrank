#!/bin/bash

GITHUB_URL=git@github.com:Aimrank
REPOSITORIES=(Aimrank.Pod Aimrank.Web Aimrank.Cluster)

for REPOSITORY in ${REPOSITORIES[@]}
do
  echo "============================================"
  echo "Cloning repository: $REPOSITORY"
  echo "============================================"
  REPO_URL=$GITHUB_URL/$REPOSITORY.git
  git clone $REPO_URL
done