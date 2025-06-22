sudo apt install python3 python-is-python3 ansible syncthing openssh-server
# get keepassxc working and access github and download the ansible playbook
# add keypassxc ppa and install it
#sudo apt install keepassxc
# get db from syncthing
# sign in to github
# create ssh key pair

# send ssh key to github
#xclip -sel clip ~/.ssh/id_rsa.pub

# clone dotfiles
#cd ~/git/dotfiles/ansible
if command -v pacman > /dev/null 2>&1; then
	sudo pacman -S --noconfirm ansible
elif command -v apt > /dev/null 2>&1; then
	sudo apt-get install -y ansible
fi
ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --ask-become-pass


#ssh-keygen -t ed25519 -C "$(whoami)@$(uname -n)-$(date -I)-install"

#pip and npm
#neovim

#npm install -g neovim
# instasll ruby
#gem install neovim
# install pearl
# install provider
#rg fd
#"Neovim::Ext" cpan module
