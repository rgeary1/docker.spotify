#!/bin/bash

set -x 
if ! docker volume inspect spotify >/dev/null 2>/dev/null; then
  docker volume create spotify
fi
docker build -t spotify --build-arg USER=$USER --build-arg UID=$UID .
