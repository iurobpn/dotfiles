#!/usr/bin/env bash
# vi: ft=bash

set -e
echo "##### Symlinking dotfile configurations #####"
echo ""

SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
HOME_DIR=/root

echo "SCRIPT_DIR=$SCRIPT_DIR"
echo "HOME_DIR=$HOME_DIR"
# userspace application configurations
# mv $HOME_DIR/.bashrc $HOME_DIR/.bashrc.bkp 2> /dev/null || echo "$HOME/.bashrc already backed up"
echo '. $HOME/.bashrc_base' >>  $HOME_DIR/.bashrc
cd $SCRIPT_DIR/../
stow -v -R -t $HOME_DIR/ home
# ssh and other configs
# stow /etc etc
cd -

echo ""
echo "############   ALL DONE   ################"

