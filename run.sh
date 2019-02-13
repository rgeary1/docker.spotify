#!/bin/bash

docker run --rm -d -e DISPLAY --device /dev/snd -v /tmp/.X11-unix:/tmp/.X11-unix -v spotify.$USER:/home/$USER --hostname=desktop spotify.$USER
