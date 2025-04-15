#!/usr/bin/env bash
# vi: ft=bash

set -e
echo "##### Symlinking dotfile configurations #####"
echo ""
HOME_DIR=$HOME
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
CONFIG_DIR=$HOME_DIR/.config
mkdir -p $CONFIG_DIR/{fish,nvim,tmux}

cd $SCRIPT_DIR

CONF_FISH=$CONFIG_DIR/fish/config.fish
[ -f $CONF_FISH ] && (unlink $CONF_FISH 2> /dev/null || mv $CONF_FISH $CONF_FISH.bkp)

GHOSTTY=$CONFIG_DIR/ghostty/config
[ -f $GHOSTTY ] && (unlink $GHOSTTY 2> /dev/null || mv $GHOSTTY $GHOSTTY.bkp)

BASHRC=$HOME_DIR/.bashrc
[ -f $BASHRC ] && (unlink $BASHRC 2> /dev/null || mv $BASHRC $BASHRC.bkp)

CONF_SSH=$HOME_DIR/.ssh/config
[ -f $CONF_SSH ] && (unlink $CONF_SSH 2> /dev/null || mv $CONF_SSH $CONF_SSH.bkp)

stow -v -R -t ~ home
# ssh and other configs
# stow /etc etc
cd -

echo ""
echo "############   ALL DONE   ################"

