#!/bin/bash

GITHUB_URL=git@github.com:Aimrank
REPOSITORIES=(Aimrank.Web Aimrank.Agones Aimrank.Agones.Cluster)

for REPOSITORY in ${REPOSITORIES[@]}
do
  echo "============================================"
  echo "Cloning repository: $REPOSITORY"
  echo "============================================"
  REPO_URL=$GITHUB_URL/$REPOSITORY.git
  git clone $REPO_URL
done