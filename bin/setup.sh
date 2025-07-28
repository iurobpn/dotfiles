#!/usr/bin/env bash
# vi: ft=bash

set -e
echo "##### Symlinking dotfile configurations #####"
echo ""
HOME_DIR=$HOME
SCRIPT_DIR=$HOME_DIR/git/dotfiles
check_n_bkp () {
	if [ -z "$1" ]; then
	       echo "usage: check_n_bkp <file_or_dir>"
       else
	       FILE=$1
	       [ -f $FILE ] && (unlink $FILE || mv $FILE $FILE.bkp) || echo "$FILE is present"
	fi
}

mkdir -p $HOME_DIR/git/pkm

# userspace application configurations
cd $SCRIPT_DIR
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
FILES=($CONFIG_DIR/fish/config.fish $CONFIG_DIR/ghostty/config $HOME_DIR/.bashrc $HOME_DIR/.ssh/config $CONFIG_DIR/btop/btop.conf $CONFIG_DIR/lazygit/config.yml $HOME_DIR/.gitconfig)
echo "${FILES[*]}"
for F in "${FILES[@]}"; do
    echo "Checking $F before stowing"
    check_n_bkp $F
    echo ''
done

stow -v -R -t ~ home
# ssh and other configs
# stow /etc etc
cd -

echo ""
echo "############   ALL DONE   ################"

