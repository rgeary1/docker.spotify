#!/bin/bash

set -x 
if ! docker volume inspect spotify.$USER >/dev/null 2>/dev/null; then
  docker volume create spotify.$USER
fi
docker build -t spotify.$USER --build-arg USER=$USER --build-arg UID=$UID .
