#!/usr/bin/env bash

IMAGE="bitlbee-discord"

if [[ ! -d "${HOME}/bitlbee" ]]; then
  mkdir "${HOME}/bitlbee"
fi

if [[ $(command -v docker) ]]; then
  echo "building docker image"
  docker build -t "${IMAGE}" . 
else
  echo "make sure that you have docker installed and running"  
fi 

echo "attemting first run of this container" 
docker run -d -v "${HOME}/bitlbee":/var/lib/bitlbee -p 16667:6667 "${IMAGE}"
