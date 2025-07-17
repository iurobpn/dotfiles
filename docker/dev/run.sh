#!/bin/bash

if [ -z "$1" ]; then
    image="dev"
else
    image=$1
fi
if [ $image="dev" ]; then
    local=local_arch
    config=config_arch
else
    local=local
    config=config
fi

xhost +local:root
docker run --net=host \
    --env="SDL_VIDEODRIVER=x11" \
    --env="XAUTHORITY=/root/.Xauthority" \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --device="/dev/dri" \
    --device="/dev/kfd" \
    --group-add 44 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$XAUTHORITY:/root/.Xauthority" \
    --volume="$HOME/.gazebo:/root/.gazebo" \
    --volume="$local:/root/.local" \
    --volume="$config:/root/.config" \
    -it --privileged $image bash

