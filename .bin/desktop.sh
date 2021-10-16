#!/bin/sh

sudo pacman -Syyu --noconfirm kitty vivaldi discord steam docker pulseaudio pavucontrol tmux neovim nodejs npm wine ttf-fira-code

yay -S --noconfirm realvnc-vnc-viewer openconnect teams

###Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Fira Code Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf

### Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
systemctl enable docker
systemctl start docker

exit
