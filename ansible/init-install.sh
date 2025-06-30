sudo apt install python3 python-is-python3 ansible openssh-server

if command -v pacman > /dev/null 2>&1; then
	sudo pacman -S --noconfirm ansible
elif command -v apt > /dev/null 2>&1; then
	sudo apt-get install -y ansible
fi

ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --ask-become-pass
