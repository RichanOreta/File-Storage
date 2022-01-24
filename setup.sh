#!/bin/sh

#curl -o ~/.config/alacritty/alacritty.yml --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/alacritty/alacritty.yml
#curl -o ~/.config/i3/config --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/i3/config
#curl -o ~/.config/lf/lfrc --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/lf/lfrc
#curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/nvim/init.vim
#curl -o ~/.config/polybar/config --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/polybar/config
#curl -o ~/.config/polybar/launch.sh --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/polybar/launch.sh
#curl -o ~/.bashrc --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/bash/.bashrc

#pacman -Rns sudo
#doas ln -s /usr/bin/doas /usr/bin/sudo

#git clone https://github.com/RichanOreta/File-Storage
#cd File-Storage
mv wallpaper/ /usr/share/backgrounds/
mv dmenu/dmenu/ ~
cd dotfiles
mv bash/.bashrc ~
mv i3/ ~/.config
mv alacritty ~/.config
mv polybar ~/.config
mv polybar-scripts ~/.config
mv lf ~/.config
cd ~/dmenu
make install
cd

su richan
sh yay.sh
exit

#sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
pacman -S reflector pacman-contrib
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --fastest 15 --latest 15 --score 15 --sort rate --protocol https --save /etc/pacman.d/mirrorlist
pacman -Syyy

yay --cleanafter true --save
curl https://raw.githubusercontent.com/RichanOreta/File-Storage/master/packages.txt | yay -S --cleanafter --needed -
yay --sudo doas --save
systemctl enable lightdm
