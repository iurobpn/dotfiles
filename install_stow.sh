#!/usr/bin/fish
# vim:set ft=fish
if not which curl
	wget https://mirrors.up.pt/pub/gnu/stow/stow-2.4.1.tar.gz
else
	curl -O https://mirrors.up.pt/pub/gnu/stow/stow-2.4.1.tar.gz
end
tar -xvf stow-2.4.1.tar.gz
cd stow-2.4.1
./configure && make
#make pdf
# perl Build.PL
