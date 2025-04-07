#!/usr/bin/env bash
# vi: ft=bash

set -e
echo "##### Symlinking dotfile configurations #####"
echo ""
HOME_DIR=/root
SCRIPT_DIR=$HOME_DIR/git/dotfiles

mkdir -p $HOME_DIR/git/pkm

# userspace application configurations
# mv $HOME_DIR/.bashrc $HOME_DIR/.bashrc.bkp 2> /dev/null || echo "$HOME/.bashrc already backed up"
echo '. $HOME/.bashrc_base' >>  $HOME_DIR/.bashrc
cd $SCRIPT_DIR
echo "home dir $HOME_DIR"
#create all config dirs
# if command -v fd > /dev/null; then
#     fd . -td -d1 -H --exec mkdir -p $HOME_DIR/home/.config/{/}
#     ls -la $HOME_DIR/home/.config
#     echo "fd installed, creating config directories"
# else
#     sudo apt install fd-find -y \
#         && fdfind . -td -d1 -H --exec mkdir -p $HOME_DIR/home/.config/{/}
#     echo "fd-find installed, please run the script again"
# fi
mkdir -p $HOME_DIR/.config/{fish,nvim,tmux}

cd $SCRIPT_DIR

stow -v -R -t ~ home
# ssh and other configs
# stow /etc etc
cd -

echo ""
echo "############   ALL DONE   ################"

