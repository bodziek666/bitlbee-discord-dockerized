#!/usr/bin/env bash

IMAGE="bitlbee-discord"

if [[ ! -d "${HOME}/.docker-bitlbee" ]]; then
  mkdir "${HOME}/.docker-bitlbee"
fi

if [[ $(command -v docker) ]]; then
  echo "building docker image"
  docker build -t "${IMAGE}" . 
else
  echo "make sure that you have docker installed and running"  
fi 

echo "attemting first run of this container" 
docker run --restart on-failure -d -u $(id -u "${USER}"):$(id -g "${USER}") -p 127.0.0.1:16667:6667 -v "${HOME}/.docker-bitlbee":/var/lib/bitlbee "${IMAGE}"
