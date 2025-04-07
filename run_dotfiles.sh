#!/usr/bin/env bash
image_name="mint:24.1"

docker run \
      --volume=$HOME/git/dotfiles:/root/git/dotfiles:rw \
      --volume=$HOME/git/scripts:/root/git/scripts:rw \
      -it $image_name bash
