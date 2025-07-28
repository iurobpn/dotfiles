sudo apt install python3 python-is-python3 ansible openssh-server

if command -v pacman > /dev/null 2>&1; then
	sudo pacman -S --noconfirm ansible
elif command -v apt > /dev/null 2>&1; then
	sudo apt-get install -y ansible
fi
#install oh-my-zsh and plugins

ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --ask-become-pass


# wget https://starship.rs/install.sh 
# sudo chmod +x install.sh
# ./install.sh -y
# rm install.sh

# harper
# lua-language-server
# tree-sitter-cli
# imagemagick
# sudo npm install -g @mermaid-js/mermaid-cli
# viu
# chafa
# ueberzugpp
# pyautoenv
# https://github.com/hsaunders1904/pyautoenv.git
# zathura
