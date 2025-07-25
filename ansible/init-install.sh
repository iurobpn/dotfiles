sudo apt install python3 python-is-python3 ansible openssh-server

if command -v pacman > /dev/null 2>&1; then
	sudo pacman -S --noconfirm ansible
elif command -v apt > /dev/null 2>&1; then
	sudo apt-get install -y ansible
fi
#install oh-my-zsh and plugins

ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --ask-become-pass

# wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
# sudo chmod +x install.sh
# ./install.sh
# sudo rm -f install.sh ~/.zshrc

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

# wget https://starship.rs/install.sh 
# sudo chmod +x install.sh
# ./install.sh -y
# rm install.sh

