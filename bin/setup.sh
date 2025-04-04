#!/usr/bin/env bash
# vi: ft=bash

echo "##### Symlinkng dotfile configurations #####"
echo ""

# userspace application configurations
mv $HOME/.bashrc $HOME/.bashrc.bkp
stow -v -R -t $HOME/ home
# ssh and other configs
#stow /etc etc

echo ""
echo "############   ALL DONE   ################"

