#!/bin/bash

docker run \
    --volume=$(pwd)/config:/root/config \
    -it \
    iubu20 \
    bash
