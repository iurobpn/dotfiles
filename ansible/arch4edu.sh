# arch4edu
#sudo pacman -S gnupg
sudo pacman-key --recv-keys 7931B6D628C8D3BA
sudo pacman-key --finger 7931B6D628C8D3BA
sudo pacman-key --lsign-key 7931B6D628C8D3BA

sudo bash -c 'echo "[arch4edu]" >> /etc/pacman.conf'
sudo bash -c 'echo "Server = https://mirror.lesviallon.fr/arch4edu/$arch" >> /etc/pacman.conf'
# echo 'Server = https://repository.arch4edu.org/$arch' >> /etc/pacman.conf
# sudo pacman -Syu
# sudo pacman -S pkgstats
