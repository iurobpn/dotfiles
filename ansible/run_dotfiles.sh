#!/usr/bin/env bash
docker run \
      --volume=$HOME/git/dotfiles:/root/git/dotfiles \
      --volume=$HOME/git/scripts:/root/git/scripts \
      -it mint:24 bash
