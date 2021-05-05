#!/bin/bash

HOME_PATH=/home/debian/Aimrank

SSH_URL=$SSH_NAME@$SSH_HOST

ssh -t $SSH_URL << EOF
  sudo mkdir -p $HOME_PATH/nginx
  sudo mkdir -p $HOME_PATH/compose
  sudo mkdir -p $HOME_PATH/postgres
  sudo chmod 777 $HOME_PATH
  sudo chmod 777 $HOME_PATH/nginx
  sudo chmod 777 $HOME_PATH/compose
  sudo chmod 777 $HOME_PATH/postgres
EOF

scp ./nginx/nginx.production.conf $SSH_URL:$HOME_PATH/nginx
scp ./scripts/deployment/deploy-remote.sh $SSH_URL:$HOME_PATH
scp ./postgres/create_databases.sql $SSH_URL:$HOME_PATH/postgres
scp ./compose/docker-compose.yml $SSH_URL:$HOME_PATH/compose
scp ./compose/docker-compose.production.yml $SSH_URL:$HOME_PATH/compose

ssh -t $SSH_URL << EOF
  cd $HOME_PATH
  sudo chmod +x deploy-remote.sh
  sudo ./deploy-remote.sh $CR_PAT $CR_USER
EOF
