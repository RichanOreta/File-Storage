#!/bin/sh

curl -o ~/.config/alacritty/alacritty.yml --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/alacritty/alacritty.yml

curl -o ~/.config/i3/config --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/i3/config

curl -o ~/.config/lf/lfrc --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/lf/lfrc

curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/nvim/init.vim

curl -o ~/.config/polybar/config --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/polybar/config

curl -o ~/.config/polybar/launch.sh --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/polybar/launch.sh

curl -o ~/.bashrc --create-dirs https://raw.githubusercontent.com/RichanOreta/File-Storage/master/dotfiles/bash/.bashrc

doas pacman -Rns sudo
doas ln -s /usr/bin/doas /usr/bin/sudo

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

doas pacman -S reflector pacman-contrib
doas cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --fastest 15 --latest 15 --score 15 --sort rate --save /etc/pacman.d/mirrorlist
doas pacman -Syyy

yay --sudo doas --save
curl https://raw.githubusercontent.com/RichanOreta/File-Storage/master/packages.txt | yay -S --cleanafter --needed -
